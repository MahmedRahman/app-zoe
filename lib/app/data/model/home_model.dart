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
    });

    List<BrandElement> departments;
    List<BrandElement> brands;
    List<FeaturedCategory> featuredCategories;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        departments: List<BrandElement>.from(json["departments"].map((x) => BrandElement.fromJson(x))),
        brands: List<BrandElement>.from(json["brands"].map((x) => BrandElement.fromJson(x))),
        featuredCategories: List<FeaturedCategory>.from(json["featured_categories"].map((x) => FeaturedCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "featured_categories": List<dynamic>.from(featuredCategories.map((x) => x.toJson())),
    };
}

class BrandElement {
    BrandElement({
        this.id,
        this.name,
        this.image='https://via.placeholder.com/300.png',
    });

    int id;
    String name;
    String image;

    factory BrandElement.fromJson(Map<String, dynamic> json) => BrandElement(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? 'https://via.placeholder.com/300.png' : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
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
    List<Product> products;

    factory FeaturedCategory.fromJson(Map<String, dynamic> json) => FeaturedCategory(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
    });

    int id;
    String name;
    ProductBrand brand;
    String image;
    double priceBeforeDiscount;
    int discountRate;
    double price;
    int rating;
    int commentsCount;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        brand: ProductBrand.fromJson(json["brand"]),
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

class ProductBrand {
    ProductBrand({
        this.id,
        this.name,
    });

    int id;
    String name;

    factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
