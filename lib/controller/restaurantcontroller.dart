import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:nested_listview_demo/model/DataModel.dart';


// Response =>
// {"status":200,"data":{"banners":[{"image_url":"https://i.ibb.co/yk2JRBN/Container-1.png","id":1},{"image_url":"https://i.ibb.co/MGVygRf/Container-1-1.png","id":2},{"image_url":"https://i.ibb.co/7j5KGhf/Container-1-2.png","id":3}],"food_categories":[{"name":"Rice","id":101,"icon":"https://i.ibb.co/pQrHF4W/rice.png"},{"name":"Healthy","id":102,"icon":"https://i.ibb.co/njSDVbP/healthy.png"},{"name":"Drink","id":103,"icon":"https://i.ibb.co/fFQM2qX/drink.png"},{"name":"Fastfood","id":104,"icon":"https://i.ibb.co/ZB6FVTK/fastfood.png"},{"name":"Snacks","id":105,"icon":"https://i.ibb.co/C7yD4Kb/snacks.png"}],"number_of_active_vouchers":5,"offer_collections":[{"name":"Freeship","id":201,"image":"https://i.ibb.co/THyc2vR/freeship.png","textcolor":"00BDD6","background":"61EDFF"},{"name":"Near You","id":202,"image":"https://i.ibb.co/WsYZNPh/nearyou.png","textcolor":"FF7700","background":"FFC796"},{"name":"Deal $1","id":203,"image":"https://i.ibb.co/2cnrM2Q/deal.png","textcolor":"00C54F","background":"00EB5E"},{"name":"Popular","id":204,"image":"https://i.ibb.co/jLK1XYK/popular.png","textcolor":"F22128","background":"FEF0F1"}],"restaurant_collections":[{"name":"Sale up to 50%","priority":1,"restaurants":[{"id":1011,"name":"Laura Green","display_distance":"30 mins","rating":4.2,"image_url":"https://i.ibb.co/SBC30V5/green.png","offers":[{"name":"Deal $1","id":203,"textcolor":"00C54F","background":"00EB5E"}]},{"id":1001,"name":"Little Milk","display_distance":"17 mins","rating":4.6,"image_url":"https://i.ibb.co/CmkPzG6/littlemilk.png","offers":[{"name":"Freeship","id":201,"textcolor":"00BDD6","background":"61EDFF"}],"additional_offer":"-25%"},{"id":1002,"name":"Thambi","display_distance":"25 mins","rating":4.4,"image_url":"https://i.ibb.co/2Yq9bsc/thambi.jpg","offers":[{"name":"Deal $1","id":203,"textcolor":"00C54F","background":"00EB5E"}]},{"id":1003,"name":"The Banjara Kitchen","display_distance":"45 mins","rating":4,"image_url":"https://i.ibb.co/bKhP8dV/banjara.jpg","offers":[{"name":"Popular","id":204,"textcolor":"F22128","background":"FEF0F1"}],"additional_offer":"₹100 off"},{"id":1004,"name":"Theobroma","display_distance":"34 mins","rating":3.9,"image_url":"https://i.ibb.co/LJBKdy3/theobroma.jpg","offers":[{"name":"Near You","id":202,"textcolor":"FF7700","background":"FFC796"}]}]},{"name":"Recommended for you","priority":0,"restaurants":[{"id":1005,"name":"Bamsu Restaurant","display_distance":"20 mins","rating":4.1,"image_url":"https://i.ibb.co/tzcXknQ/bamsu.png","offers":[],"additional_offer":"₹100 off"},{"id":1006,"name":"B'Fresh Coffee","display_distance":"30 mins","rating":4.5,"image_url":"ttps://i.ibb.co/Qr3ssZP/bfresh.png","offers":[{"name":"Freeship","id":201,"textcolor":"00BDD6","background":"61EDFF"},{"name":"Near You","id":202,"textcolor":"FF7700","background":"FFC796"}]},{"id":1007,"name":"Burger King","display_distance":"34 mins","rating":4.8,"image_url":"https://i.ibb.co/bHL69MV/burgerking.jpg","offers":[{"name":"Deal $1","id":203,"textcolor":"00C54F","background":"00EB5E"},{"name":"Near You","id":202}],"additional_offer":"-25%"},{"id":1008,"name":"Bake your day","display_distance":"15 mins","rating":3.8,"image_url":"https://i.ibb.co/mRPkWxG/bakeyourday.jpg","offers":[{"name":"Deal $1","id":203,"textcolor":"00C54F","background":"00EB5E"},{"name":"Popular","id":204,"textcolor":"F22128","background":"FEF0F1"}]},{"id":1009,"name":"Wraps And Rolls","display_distance":"25 mins","rating":3.7,"image_url":"https://i.ibb.co/SBxdD3x/wraps.png","offers":[],"additional_offer":"-25%"}]}]}}

class RestaurantController extends GetxController {
  DataModel? responseValue;
  var isLoading = false.obs;
  var url = "https://mocki.io/v1/0c5d380f-972a-44c9-bd11-ca5a2f154019";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try{
      isLoading(true);
      http.Response response= await http.get(Uri.tryParse(url)!);

      if(response.statusCode == 200){
        var res = jsonDecode(response.body);
        responseValue = DataModel.fromJson(res);
      }
      else {
        //error
        print("Error fetching Data");
      }
      isLoading(false);
    }
    catch(e){
      isLoading(false);
      print("Exception occurred: $e");
    }
    finally{
      isLoading(false);
    }
  }
}