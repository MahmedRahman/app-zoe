// To parse this JSON data, do
//
//     final wishListModel = wishListModelFromJson(jsonString);

import 'dart:convert';

WishListModel wishListModelFromJson(String str) => WishListModel.fromJson(json.decode(str));

String wishListModelToJson(WishListModel data) => json.encode(data.toJson());

class WishListModel {
    WishListModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
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
        this.products,
    });

    List<Product> products;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.brand,
        this.image,
        this.priceBeforeDiscount,
        this.discountRate,
        this.price,
        this.rating,
        this.commentsCount,
        this.wishlist,
    });

    int id;
    String name;
    Brand brand;
    String image;
    double priceBeforeDiscount;
    int discountRate;
    double price;
    int rating;
    int commentsCount;
    bool wishlist;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brand: Brand.fromJson(json["brand"]),
        image: json["image"],
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        discountRate: json["discount_rate"],
        price: json["price"].toDouble(),
        rating: json["rating"],
        commentsCount: json["comments_count"],
        wishlist: json["wishlist"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand.toJson(),
        "image": image,
        "price_before_discount": priceBeforeDiscount,
        "discount_rate": discountRate,
        "price": price,
        "rating": rating,
        "comments_count": commentsCount,
        "wishlist": wishlist,
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
