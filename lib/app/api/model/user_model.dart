// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.success,
        this.message,
        this.data,
        this.code,
    });

    bool success;
    String message;
    Data data;
    int code;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
        "code": code,
    };
}

class Data {
    Data({
        this.name,
        this.mobile,
        this.email,
        this.type,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.accessToken,
    });

    String name;
    String mobile;
    String email;
    int type;
    DateTime updatedAt;
    DateTime createdAt;
    int id;
    String accessToken;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "email": email,
        "type": type,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
        "access_token": accessToken,
    };
}
