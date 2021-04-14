// To parse this JSON data, do
//
//     final departmentCategoryBrandModel = departmentCategoryBrandModelFromJson(jsonString);

import 'dart:convert';

DepartmentCategoryBrandModel departmentCategoryBrandModelFromJson(String str) => DepartmentCategoryBrandModel.fromJson(json.decode(str));

String departmentCategoryBrandModelToJson(DepartmentCategoryBrandModel data) => json.encode(data.toJson());

class DepartmentCategoryBrandModel {
    DepartmentCategoryBrandModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory DepartmentCategoryBrandModel.fromJson(Map<String, dynamic> json) => DepartmentCategoryBrandModel(
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
        this.categories,
        this.brands,
    });

    Department department;
    List<Category> categories;
    List<Department> brands;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        department: Department.fromJson(json["department"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        brands: List<Department>.from(json["brands"].map((x) => Department.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "department": department.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
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
