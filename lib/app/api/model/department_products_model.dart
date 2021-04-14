// To parse this JSON data, do
//
//     final departmentProductsModel = departmentProductsModelFromJson(jsonString);

import 'dart:convert';

DepartmentProductsModel departmentProductsModelFromJson(String str) => DepartmentProductsModel.fromJson(json.decode(str));

String departmentProductsModelToJson(DepartmentProductsModel data) => json.encode(data.toJson());

class DepartmentProductsModel {
    DepartmentProductsModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory DepartmentProductsModel.fromJson(Map<String, dynamic> json) => DepartmentProductsModel(
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
        this.department,
        this.products,
    });

    Department department;
    List<Product> products;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        department: Department.fromJson(json["department"]),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "department": department.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Department {
    Department({
        this.id,
        this.name,
        this.image,
    });

    int id;
    String name;
    String image;

    factory Department.fromJson(Map<String, dynamic> json) => Department(
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

class Product {
    Product({
        this.id,
        this.name,
        this.image,
        this.brand,
        this.priceBeforeDiscount,
        this.discountRate,
        this.price,
        this.rating,
        this.commentsCount,
        this.wishlist,
        this.defaultSize,
    });

    int id;
    String name;
    String image;
    Brand brand;
    int priceBeforeDiscount;
    int discountRate;
    int price;
    int rating;
    int commentsCount;
    bool wishlist;
    DefaultSize defaultSize;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        brand: Brand.fromJson(json["brand"]),
        priceBeforeDiscount: json["price_before_discount"],
        discountRate: json["discount_rate"],
        price: json["price"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        wishlist: json["wishlist"],
        defaultSize: DefaultSize.fromJson(json["default_size"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
        "brand": brand.toJson(),
        "price_before_discount": priceBeforeDiscount,
        "discount_rate": discountRate,
        "price": price,
        "rating": rating,
        "comments_count": commentsCount,
        "wishlist": wishlist,
        "default_size": defaultSize.toJson(),
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

class DefaultSize {
    DefaultSize({
        this.id,
        this.size,
    });

    int id;
    dynamic size;

    factory DefaultSize.fromJson(Map<String, dynamic> json) => DefaultSize(
        id: json["id"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
    };
}
