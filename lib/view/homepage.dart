import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_listview_demo/controller/restaurantcontroller.dart';
import 'package:nested_listview_demo/model/DataModel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.title});

  final String title;

  final restaurantController = Get.put(RestaurantController());

  Color? getColor(String color) {
    return color.isEmpty
        ? Colors.grey[100]
        : Color(int.parse("FF" + color, radix: 16));
  }

  RestaurantCollections? getRestaurantCollections(bool firstList) {
    RestaurantCollections? collectionsZero =
        restaurantController.responseValue?.data?.restaurantCollections![0];
    RestaurantCollections? collectionsOne =
        restaurantController.responseValue?.data?.restaurantCollections![1];
    num? priortyZero = collectionsZero?.priority;
    num? priortyOne = collectionsOne?.priority;
    if (priortyZero! < priortyOne!) {
      return firstList ? collectionsZero : collectionsOne;
    } else {
      return firstList ? collectionsOne : collectionsZero;
    }
  }

  String getRestaurantCollectionsName(bool first) {
    RestaurantCollections? collections = getRestaurantCollections(first);
    return collections?.name ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
            child: Obx(
          () => restaurantController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: restaurantController
                              .responseValue?.data?.banners?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => restaurantController
                                      .responseValue
                                      ?.data
                                      ?.banners?[index]!
                                      .imageUrl ==
                                  null
                              ? const Icon(Icons.cloud_download)
                              : Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(8, 16, 8, 8),
                                  width: 300,
                                  height: 160,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              restaurantController
                                                      .responseValue
                                                      ?.data
                                                      ?.banners?[index]!
                                                      .imageUrl ??
                                                  ""))),
                                ),
                        )),
                    SizedBox(
                        height: 140,
                        child: ListView.builder(
                            itemCount: restaurantController
                                .responseValue?.data?.foodCategories?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    restaurantController
                                                .responseValue
                                                ?.data
                                                ?.foodCategories?[index]!
                                                .icon ==
                                            null
                                        ? const Icon(Icons.cloud_download)
                                        : Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 0),
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        restaurantController
                                                                .responseValue
                                                                ?.data
                                                                ?.foodCategories?[
                                                                    index]!
                                                                .icon ??
                                                            ""))),
                                          ),
                                    Center(
                                      child: Text(restaurantController
                                              .responseValue
                                              ?.data
                                              ?.foodCategories?[index]!
                                              .name ??
                                          ""),
                                    )
                                  ],
                                ))),
                    Container(
                        height: 32,
                        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange[100],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(Icons.discount, size: 20),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "You have ${restaurantController.responseValue?.data?.numberOfActiveVouchers} voucher here",
                            ),
                            Expanded(
                                child: Stack(
                              children: const [
                                Positioned(
                                    right: 8,
                                    top: 4,
                                    child: Icon(Icons.chevron_right, size: 24)),
                              ],
                            ))
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8, 16, 0, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Collections",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: restaurantController
                          .responseValue?.data?.offerCollections?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                      ),
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: getColor(""),
                          ),
                          child: Row(
                            children: [
                              Image.network(restaurantController.responseValue
                                      ?.data?.offerCollections?[index]!.image ??
                                  ""),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                restaurantController.responseValue?.data
                                        ?.offerCollections?[index]!.name ??
                                    "",
                                style: TextStyle(
                                    color: getColor(restaurantController
                                            .responseValue
                                            ?.data
                                            ?.offerCollections?[index]!
                                            .textcolor ??
                                        "")),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 16, 0, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getRestaurantCollectionsName(true),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                          itemCount: getRestaurantCollections(true)
                              ?.restaurants
                              ?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.grey[100],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                getRestaurantCollections(true)
                                                        ?.restaurants?[index]!
                                                        .imageUrl ??
                                                    ""))),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      getRestaurantCollections(true)
                                              ?.restaurants?[index]!
                                              .name ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          getRestaurantCollections(true)
                                                  ?.restaurants?[index]!
                                                  .displayDistance ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 10),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.star_rate,
                                        size: 16,
                                        color: Colors.orange[300],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${getRestaurantCollections(true)?.restaurants?[index]!.rating ?? ""}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getRestaurantCollectionsName(false),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                          itemCount: getRestaurantCollections(false)
                              ?.restaurants
                              ?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Colors.grey[100],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                getRestaurantCollections(false)
                                                        ?.restaurants?[index]!
                                                        .imageUrl ??
                                                    ""))),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      getRestaurantCollections(false)
                                              ?.restaurants?[index]!
                                              .name ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          getRestaurantCollections(false)
                                                  ?.restaurants?[index]!
                                                  .displayDistance ??
                                              "",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 10),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Icon(
                                        Icons.star_rate,
                                        size: 16,
                                        color: Colors.orange[300],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${getRestaurantCollections(false)?.restaurants?[index]!.rating ?? ""}",
                                          style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // getRestaurantCollections(false)
                                  //             ?.restaurants?[index]
                                  //             ?.offers?[0] !=
                                  //         null
                                  //     ? Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //         children: [
                                  //           getRestaurantCollections(false)
                                  //                       ?.restaurants?[index]
                                  //                       ?.offers?[0] !=
                                  //                   null
                                  //               ? Align(
                                  //                   alignment:
                                  //                       Alignment.centerLeft,
                                  //                   child: Text(
                                  //                     getRestaurantCollections(
                                  //                                 false)
                                  //                             ?.restaurants?[
                                  //                                 index]
                                  //                             ?.offers?[0]!
                                  //                             .name ??
                                  //                         "",
                                  //                     style: TextStyle(
                                  //                         color: getColor(
                                  //                             getRestaurantCollections(
                                  //                                         false)
                                  //                                     ?.restaurants?[
                                  //                                         index]
                                  //                                     ?.offers?[
                                  //                                         0]
                                  //                                     ?.textcolor ??
                                  //                                 ""),
                                  //                         fontSize: 10),
                                  //                   ),
                                  //                 )
                                  //               : Container(),
                                  //           const SizedBox(
                                  //             width: 16,
                                  //           ),
                                  //           (getRestaurantCollections(false)
                                  //                       ?.restaurants?[index]
                                  //                       ?.offers?[1] !=
                                  //                   null)
                                  //               ? Align(
                                  //                   alignment:
                                  //                       Alignment.centerLeft,
                                  //                   child: Text(
                                  //                     getRestaurantCollections(
                                  //                                 false)
                                  //                             ?.restaurants?[
                                  //                                 index]
                                  //                             ?.offers?[1]!
                                  //                             .name ??
                                  //                         "",
                                  //                     style: TextStyle(
                                  //                         color: getColor(
                                  //                             getRestaurantCollections(
                                  //                                         false)
                                  //                                     ?.restaurants?[
                                  //                                         index]
                                  //                                     ?.offers?[
                                  //                                         1]
                                  //                                     ?.textcolor ??
                                  //                                 ""),
                                  //                         fontSize: 10),
                                  //                   ),
                                  //                 )
                                  //               : Container(),
                                  //         ],
                                  //       )
                                  //     : Container(),
                                ],
                              ))),
                    ),
                  ],
                ),
        )));
  }
}
