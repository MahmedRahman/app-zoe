// To parse this JSON data, do
//
//     final categoryProductsModel = categoryProductsModelFromJson(jsonString);

import 'dart:convert';

CategoryProductsModel categoryProductsModelFromJson(String str) => CategoryProductsModel.fromJson(json.decode(str));

String categoryProductsModelToJson(CategoryProductsModel data) => json.encode(data.toJson());

class CategoryProductsModel {
    CategoryProductsModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory CategoryProductsModel.fromJson(Map<String, dynamic> json) => CategoryProductsModel(
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
        this.category,
        this.products,
    });

    Category category;
    List<Product> products;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: Category.fromJson(json["category"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": category.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
    });

    int id;
    String name;
    Category brand;
    String image;
    double priceBeforeDiscount;
    int discountRate;
    double price;
    int rating;
    int commentsCount;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brand: Category.fromJson(json["brand"]),
        image: json["image"] == null ? null : json["image"],
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        discountRate: json["discount_rate"],
        price: json["price"].toDouble(),
        rating: json["rating"],
        commentsCount: json["comments_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brand.toJson(),
        "image": image == null ? null : image,
        "price_before_discount": priceBeforeDiscount,
        "discount_rate": discountRate,
        "price": price,
        "rating": rating,
        "comments_count": commentsCount,
    };
}
