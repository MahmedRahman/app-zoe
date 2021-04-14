// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) => DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
    DepartmentModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    Data data;

    factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
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
