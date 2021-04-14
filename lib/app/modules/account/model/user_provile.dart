// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
    UserProfileModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    Data data;
    int code;

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "code": code,
    };
}

class Data {
    Data({
        this.name,
        this.email,
        this.mobile,
        this.address,
    });

    String name;
    String email;
    String mobile;
    dynamic address;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address,
    };
}
