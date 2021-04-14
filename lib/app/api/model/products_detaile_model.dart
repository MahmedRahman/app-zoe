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
        this.category,
    });

    Product product;
    List<String> productImages;
    Brand brand;
    Category department;
    Category category;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: Product.fromJson(json["product"]),
        productImages: List<String>.from(json["product_images"].map((x) => x)),
        brand: Brand.fromJson(json["brand"]),
        department: Category.fromJson(json["department"]),
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "product_images": List<dynamic>.from(productImages.map((x) => x)),
        "brand": brand.toJson(),
        "department": department.toJson(),
        "category": category.toJson(),
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
        this.desc,
        this.priceBeforeDiscount,
        this.discountRate,
        this.price,
        this.rating,
        this.commentsCount,
        this.wishlist,
        this.defaultSize,
        this.colors,
        this.sizes,
    });

    int id;
    String name;
    String desc;
    dynamic priceBeforeDiscount;
    dynamic discountRate;
    dynamic price;
    dynamic rating;
    dynamic commentsCount;
    bool wishlist;
    DefaultSize defaultSize;
    List<Color> colors;
    List<Size> sizes;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        priceBeforeDiscount: json["price_before_discount"],
        discountRate: json["discount_rate"],
        price: json["price"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        wishlist: json["wishlist"],
        defaultSize: DefaultSize.fromJson(json["default_size"]),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
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
        "wishlist": wishlist,
        "default_size": defaultSize.toJson(),
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    };
}

class Color {
    Color({
        this.id,
        this.title,
        this.color,
    });

    int id;
    String title;
    String color;

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        title: json["title"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
    };
}

class DefaultSize {
    DefaultSize({
        this.id,
        this.size,
    });

    int id;
    String size;

    factory DefaultSize.fromJson(Map<String, dynamic> json) => DefaultSize(
        id: json["id"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
    };
}

class Size {
    Size({
        this.id,
        this.title,
        this.price,
    });

    int id;
    String title;
    dynamic price;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        title: json["title"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
    };
}
