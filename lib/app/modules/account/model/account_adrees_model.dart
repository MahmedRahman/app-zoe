// To parse this JSON data, do
//
//     final accountAdreesModel = accountAdreesModelFromJson(jsonString);

import 'dart:convert';

AccountAdreesModel accountAdreesModelFromJson(String str) => AccountAdreesModel.fromJson(json.decode(str));

String accountAdreesModelToJson(AccountAdreesModel data) => json.encode(data.toJson());

class AccountAdreesModel {
    AccountAdreesModel({
        this.success,
        this.code,
        this.data,
    });

    bool success;
    int code;
    List<Datum> data;

    factory AccountAdreesModel.fromJson(Map<String, dynamic> json) => AccountAdreesModel(
        success: json["success"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.address,
        this.city,
        this.shippingFees,
    });

    int id;
    String address;
    String city;
    int shippingFees;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        address: json["address"],
        city: json["city"],
        shippingFees: json["shipping_fees"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "shipping_fees": shippingFees,
    };
}
