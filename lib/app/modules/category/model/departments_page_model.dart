// To parse this JSON data, do
//
//     final departmentsPageModel = departmentsPageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DepartmentsPageModel departmentsPageModelFromJson(String str) => DepartmentsPageModel.fromJson(json.decode(str));

String departmentsPageModelToJson(DepartmentsPageModel data) => json.encode(data.toJson());

class DepartmentsPageModel {
    DepartmentsPageModel({
        @required this.success,
        @required this.code,
        @required this.data,
    });

    bool success;
    int code;
    Data data;

    factory DepartmentsPageModel.fromJson(Map<String, dynamic> json) => DepartmentsPageModel(
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
        @required this.departments,
    });

    List<Department> departments;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
    };
}

class Department {
    Department({
        @required this.id,
        @required this.name,
        @required this.image,
        @required this.categories,
        @required this.brands,
    });

    int id;
    String name;
    String image;
    List<Category> categories;
    List<Brand> brands;

    factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class Brand {
    Brand({
        @required this.id,
        @required this.name,
        @required this.image,
    });

    int id;
    String name;
    String image;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
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

class Category {
    Category({
        @required this.id,
        @required this.name,
            @required this.image,
    });

    int id;
    String name;
    String image;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
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
