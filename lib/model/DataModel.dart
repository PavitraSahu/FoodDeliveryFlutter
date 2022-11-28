class DataModel {
  num? status;
  Data? data;

  DataModel({this.status, this.data});

  DataModel.fromJson(Map<String, dynamic> json) {
    try {
      status = json['status'];
      data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    } catch (e) {
      print("Exception in DataModel");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Banners>? banners;
  List<FoodCategories>? foodCategories;
  num? numberOfActiveVouchers;
  List<OfferCollections>? offerCollections;
  List<RestaurantCollections>? restaurantCollections;

  Data(
      {this.banners,
      this.foodCategories,
      this.numberOfActiveVouchers,
      this.offerCollections,
      this.restaurantCollections});

  Data.fromJson(Map<String, dynamic> json) {
    try {
      if (json['banners'] != null) {
        banners = <Banners>[];
        json['banners'].forEach((v) {
          banners!.add(new Banners.fromJson(v));
        });
      }
      if (json['food_categories'] != null) {
        foodCategories = <FoodCategories>[];
        json['food_categories'].forEach((v) {
          foodCategories!.add(new FoodCategories.fromJson(v));
        });
      }
      numberOfActiveVouchers = json['number_of_active_vouchers'];
      if (json['offer_collections'] != null) {
        offerCollections = <OfferCollections>[];
        json['offer_collections'].forEach((v) {
          offerCollections!.add(new OfferCollections.fromJson(v));
        });
      }
      if (json['restaurant_collections'] != null) {
        restaurantCollections = <RestaurantCollections>[];
        json['restaurant_collections'].forEach((v) {
          restaurantCollections!.add(new RestaurantCollections.fromJson(v));
        });
      }
    } catch (e) {
      print("Exception in Data");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.foodCategories != null) {
      data['food_categories'] =
          this.foodCategories!.map((v) => v.toJson()).toList();
    }
    data['number_of_active_vouchers'] = this.numberOfActiveVouchers;
    if (this.offerCollections != null) {
      data['offer_collections'] =
          this.offerCollections!.map((v) => v.toJson()).toList();
    }
    if (this.restaurantCollections != null) {
      data['restaurant_collections'] =
          this.restaurantCollections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  String? imageUrl;
  num? id;

  Banners({this.imageUrl, this.id});

  Banners.fromJson(Map<String, dynamic> json) {
    try {
      imageUrl = json['image_url'];
      id = json['id'];
    } catch (e) {
      print("Exception in Banners");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}

class FoodCategories {
  String? name;
  num? id;
  String? icon;

  FoodCategories({this.name, this.id, this.icon});

  FoodCategories.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      id = json['id'];
      icon = json['icon'];
    } catch (e) {
      print("Exception in FoodCategories");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['icon'] = this.icon;
    return data;
  }
}

class OfferCollections {
  String? name;
  num? id;
  String? image;
  String? textcolor;
  String? background;

  OfferCollections(
      {this.name, this.id, this.image, this.textcolor, this.background});

  OfferCollections.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      id = json['id'];
      image = json['image'];
      textcolor = json['textcolor'];
      background = json['background'];
    } catch (e) {
      print("Exception in OfferCollections");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['image'] = this.image;
    data['textcolor'] = this.textcolor;
    data['background'] = this.background;
    return data;
  }
}

class RestaurantCollections {
  String? name;
  num? priority;
  List<Restaurants>? restaurants;

  RestaurantCollections({this.name, this.priority, this.restaurants});

  RestaurantCollections.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      priority = json['priority'];
      if (json['restaurants'] != null) {
        restaurants = <Restaurants>[];
        json['restaurants'].forEach((v) {
          restaurants!.add(new Restaurants.fromJson(v));
        });
      }
    } catch (e) {
      print("Exception in RestaurantCollections");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['priority'] = this.priority;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
  num? id;
  String? name;
  String? displayDistance;
  num? rating;
  String? imageUrl;
  List<Offers>? offers;
  String? additionalOffer;

  Restaurants(
      {this.id,
      this.name,
      this.displayDistance,
      this.rating,
      this.imageUrl,
      this.offers,
      this.additionalOffer});

  Restaurants.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
      name = json['name'];
      displayDistance = json['display_distance'];
      rating = json['rating'];
      imageUrl = json['image_url'];
      if (json['offers'] != null) {
        offers = <Offers>[];
        json['offers'].forEach((v) {
          offers!.add(new Offers.fromJson(v));
        });
      }
      additionalOffer = json['additional_offer'];
    } catch (e) {
      print("Exception in Restaurants");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_distance'] = this.displayDistance;
    data['rating'] = this.rating;
    data['image_url'] = this.imageUrl;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    data['additional_offer'] = this.additionalOffer;
    return data;
  }
}

class Offers {
  String? name;
  num? id;
  String? textcolor;
  String? background;

  Offers({this.name, this.id, this.textcolor, this.background});

  Offers.fromJson(Map<String, dynamic> json) {
    try {
      name = json['name'];
      id = json['id'];
      textcolor = json['textcolor'];
      background = json['background'];
    } catch (e) {
      print("Exception in Offers");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['textcolor'] = this.textcolor;
    data['background'] = this.background;
    return data;
  }
}
