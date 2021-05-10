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
        this.specifications,
        this.brand,
        this.department,
        this.category,
        this.similarProducts,
    });

    Product product;
    List<String> productImages;
    List<Specification> specifications;
    Brand brand;
    Category department;
    Category category;
    List<SimilarProduct> similarProducts;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: Product.fromJson(json["product"]),
        productImages: List<String>.from(json["product_images"].map((x) => x)),
        specifications: List<Specification>.from(json["specifications"].map((x) => Specification.fromJson(x))),
        brand: Brand.fromJson(json["brand"]),
        department: Category.fromJson(json["department"]),
        category: Category.fromJson(json["category"]),
        similarProducts: List<SimilarProduct>.from(json["similar_products"].map((x) => SimilarProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "product": product.toJson(),
        "product_images": List<dynamic>.from(productImages.map((x) => x)),
        "specifications": List<dynamic>.from(specifications.map((x) => x.toJson())),
        "brand": brand.toJson(),
        "department": department.toJson(),
        "category": category.toJson(),
        "similar_products": List<dynamic>.from(similarProducts.map((x) => x.toJson())),
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
    double priceBeforeDiscount;
    dynamic discountRate;
    double price;
    dynamic rating;
    int commentsCount;
    bool wishlist;
    DefaultSize defaultSize;
    List<Color> colors;
    List<Size> sizes;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        priceBeforeDiscount: json["price_before_discount"].toDouble(),
        discountRate: json["discount_rate"],
        price: json["price"].toDouble(),
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
         this.image,
    });

    int id;
    String title;
    String color;
String image;
    

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        title: json["title"],
        color: json["color"],
           image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
         "image": image,
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
        size: json["size"] == null ? null : json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "size": size == null ? null : size,
    };
}

class Size {
    Size({
        this.id,
        this.title,
        this.price,
        this.priceBeforeDiscount,
    });

    int id;
    String title;
    var price;
    var priceBeforeDiscount;

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        priceBeforeDiscount: json["price_before_discount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "price_before_discount": priceBeforeDiscount,
    };
}

class SimilarProduct {
    SimilarProduct({
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
        this.brand,
    });

    int id;
    String name;
    String image;
    var priceBeforeDiscount;
    var price;
    bool wishlist;
    var discountRate;
    var rating;
    var commentsCount;
    DefaultSize defaultSize;
    Category brand;

    factory SimilarProduct.fromJson(Map<String, dynamic> json) => SimilarProduct(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        priceBeforeDiscount: json["price_before_discount"],
        price: json["price"],
        wishlist: json["wishlist"],
        discountRate: json["discount_rate"],
        rating: json["rating"],
        commentsCount: json["comments_count"],
        defaultSize: DefaultSize.fromJson(json["default_size"]),
        brand: Category.fromJson(json["brand"]),
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
        "brand": brand.toJson(),
    };
}

class Specification {
    Specification({
        this.title,
        this.value,
    });

    String title;
    String value;

    factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        title: json["title"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
    };
}