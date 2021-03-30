// To parse this JSON data, do
//
//     final productsDetaileModel = productsDetaileModelFromJson(jsonString);

import 'dart:convert';

ProductsDetaileModel productsDetaileModelFromJson(String str) => ProductsDetaileModel.fromJson(json.decode(str));

String productsDetaileModelToJson(ProductsDetaileModel data) => json.encode(data.toJson());

class ProductsDetaileModel {
    ProductsDetaileModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory ProductsDetaileModel.fromJson(Map<String, dynamic> json) => ProductsDetaileModel(
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
        this.product,
        this.productImages,
        this.brand,
        this.department,
    });

    Product product;
    List<String> productImages;
    Brand brand;
    Department department;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: Product.fromJson(json["product"]),
        productImages: List<String>.from(json["product_images"].map((x) => x)),
        brand: Brand.fromJson(json["brand"]),
        department: Department.fromJson(json["department"]),
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "product_images": List<dynamic>.from(productImages.map((x) => x)),
        "brand": brand.toJson(),
        "department": department.toJson(),
    };
}

class Brand {
    Brand({
        this.id,
        this.name,
        this.image,
    });

    int id;
    String name;
    String image;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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

class Department {
    Department({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory Department.fromJson(Map<String, dynamic> json) => Department(
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
        this.desc,
        this.priceBeforeDiscount,
        this.discountRate,
        this.price,
        this.rating,
        this.commentsCount,
    });

    int id;
    String name;
    String desc;
    double priceBeforeDiscount;
    int discountRate;
    double price;
    int rating;
    int commentsCount;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        discountRate: json["discount_rate"],
        price: json["price"].toDouble(),
        rating: json["rating"],
        commentsCount: json["comments_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price_before_discount": priceBeforeDiscount,
        "discount_rate": discountRate,
        "price": price,
        "rating": rating,
        "comments_count": commentsCount,
    };
}
