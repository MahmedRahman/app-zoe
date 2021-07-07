// To parse this JSON data, do
//
//     final offersListModel = offersListModelFromJson(jsonString);

import 'dart:convert';

OffersListModel offersListModelFromJson(String str) => OffersListModel.fromJson(json.decode(str));

String offersListModelToJson(OffersListModel data) => json.encode(data.toJson());

class OffersListModel {
    OffersListModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    List<Datum> data;

    factory OffersListModel.fromJson(Map<String, dynamic> json) => OffersListModel(
        success: json["success"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
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
    int priceBeforeDiscount;
    double price;
    bool wishlist;
    int discountRate;
    int rating;
    int commentsCount;
    Default defaultSize;
    Default defaultColor;
    Brand brand;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        priceBeforeDiscount: json["price_before_discount"],
        price: json["price"].toDouble(),
        wishlist: json["wishlist"],
        discountRate: json["discount_rate"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        defaultSize: Default.fromJson(json["default_size"]),
        defaultColor: Default.fromJson(json["default_color"]),
        brand: Brand.fromJson(json["brand"]),
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

class Brand {
    Brand({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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
    dynamic size;

    factory Default.fromJson(Map<String, dynamic> json) => Default(
        id: json["id"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
    };
}
