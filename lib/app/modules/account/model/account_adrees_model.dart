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
        this.provinance,
        this.city,
        this.deliveryDays,
        this.shippingFees,
        this.lat,
        this.lang,
        this.landMark,
    });

    int id;
    String address;
    String provinance;
    String city;
    String deliveryDays;
    int shippingFees;
    String lat;
    String lang;
    String landMark;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        address: json["address"],
        provinance: json["provinance"],
        city: json["city"],
        deliveryDays: json["delivery_days"],
        shippingFees: json["shipping_fees"],
        lat: json["lat"] == null ? null : json["lat"],
        lang: json["lang"] == null ? null : json["lang"],
        landMark: json["land_mark"] == null ? null : json["land_mark"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "provinance": provinance,
        "city": city,
        "delivery_days": deliveryDays,
        "shipping_fees": shippingFees,
        "lat": lat == null ? null : lat,
        "lang": lang == null ? null : lang,
        "land_mark": landMark == null ? null : landMark,
    };
}
