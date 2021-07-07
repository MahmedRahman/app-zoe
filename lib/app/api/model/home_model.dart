// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
    HomeModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json["success"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.departments,
        this.brands,
        this.featuredCategories,
        this.ads,
        this.bannerOne,
        this.bannerTwo,
        this.bannerThree,
        this.offers,
    });

    List<BrandElement> departments;
    List<BrandElement> brands;
    List<FeaturedCategory> featuredCategories;
    List<Ad> ads;
    String bannerOne;
    String bannerTwo;
    String bannerThree;
    List<Offer> offers;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        departments: List<BrandElement>.from(json["departments"].map((x) => BrandElement.fromJson(x))),
        brands: List<BrandElement>.from(json["brands"].map((x) => BrandElement.fromJson(x))),
        featuredCategories: List<FeaturedCategory>.from(json["featured_categories"].map((x) => FeaturedCategory.fromJson(x))),
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
        bannerOne: json["banner_one"],
        bannerTwo: json["banner_two"],
        bannerThree: json["banner_three"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "featured_categories": List<dynamic>.from(featuredCategories.map((x) => x.toJson())),
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
        "banner_one": bannerOne,
        "banner_two": bannerTwo,
        "banner_three": bannerThree,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}

class Ad {
    Ad({
        this.image,
    });

    String image;

    factory Ad.fromJson(Map<String, dynamic> json) => Ad(
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
    };
}

class BrandElement {
    BrandElement({
        this.id,
        this.name,
        this.image,
    });

    int id;
    String name;
    String image;

    factory BrandElement.fromJson(Map<String, dynamic> json) => BrandElement(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
    };
}

class FeaturedCategory {
    FeaturedCategory({
        this.id,
        this.name,
        this.products,
    });

    int id;
    String name;
    List<Offer> products;

    factory FeaturedCategory.fromJson(Map<String, dynamic> json) => FeaturedCategory(
        id: json["id"],
        name: json["name"],
        products: List<Offer>.from(json["products"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Offer {
    Offer({
        this.id,
        this.name,
        this.image,
        this.priceBeforeDiscount,
        this.price,
        this.wishlist,
        this.discountRate,
        this.rating,
        this.commentsCount,
        this.defaultSize,
        this.defaultColor,
        this.brand,
    });

    int id;
    String name;
    String image;
    var priceBeforeDiscount;
    var price;
    bool wishlist;
    int discountRate;
    int rating;
    int commentsCount;
    Default defaultSize;
    Default defaultColor;
    OfferBrand brand;

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        priceBeforeDiscount: json["price_before_discount"],
        price: json["price"],
        wishlist: json["wishlist"],
        discountRate: json["discount_rate"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        defaultSize: Default.fromJson(json["default_size"]),
        defaultColor: Default.fromJson(json["default_color"]),
        brand: OfferBrand.fromJson(json["brand"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price_before_discount": priceBeforeDiscount,
        "price": price,
        "wishlist": wishlist,
        "discount_rate": discountRate,
        "rating": rating,
        "comments_count": commentsCount,
        "default_size": defaultSize.toJson(),
        "default_color": defaultColor.toJson(),
        "brand": brand.toJson(),
    };
}

class OfferBrand {
    OfferBrand({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory OfferBrand.fromJson(Map<String, dynamic> json) => OfferBrand(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Default {
    Default({
        this.id,
        this.size,
    });

    int id;
    String size;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        id: json["id"],
        size: json["size"] == null ? null : json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size == null ? null : size,
    };
}
