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
    });

    List<BrandElement> departments;
    List<BrandElement> brands;
    List<FeaturedCategory> featuredCategories;
    List<Ad> ads;
    String bannerOne;
    String bannerTwo;
    dynamic bannerThree;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        departments: List<BrandElement>.from(json["departments"].map((x) => BrandElement.fromJson(x))),
        brands: List<BrandElement>.from(json["brands"].map((x) => BrandElement.fromJson(x))),
        featuredCategories: List<FeaturedCategory>.from(json["featured_categories"].map((x) => FeaturedCategory.fromJson(x))),
        ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
        bannerOne: json["banner_one"],
        bannerTwo: json["banner_two"],
        bannerThree: json["banner_three"],
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
        "featured_categories": List<dynamic>.from(featuredCategories.map((x) => x.toJson())),
        "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
        "banner_one": bannerOne,
        "banner_two": bannerTwo,
        "banner_three": bannerThree,
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
        image: json["image"] == null ? null : json["image"],
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
    double priceBeforeDiscount;
    double price;
    bool wishlist;
    int discountRate;
    int rating;
    int commentsCount;
    DefaultSize defaultSize;
    DefaultColor defaultColor;
    ProductBrand brand;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        price: json["price"].toDouble(),
        wishlist: json["wishlist"],
        discountRate: json["discount_rate"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        defaultSize: DefaultSize.fromJson(json["default_size"]),
        defaultColor: DefaultColor.fromJson(json["default_color"]),
        brand: ProductBrand.fromJson(json["brand"]),
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

class DefaultColor {
    DefaultColor({
        this.id,
        this.color,
        this.size,
    });

    int id;
    String color;
    dynamic size;

    factory DefaultColor.fromJson(Map<String, dynamic> json) => DefaultColor(
        id: json["id"],
        color: json["color"] == null ? null : json["color"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color == null ? null : color,
        "size": size,
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
