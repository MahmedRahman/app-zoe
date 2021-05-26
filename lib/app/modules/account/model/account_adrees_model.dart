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
        this.lat,
        this.lang,
        this.district,
        this.building,
        this.houseNumber,
        this.landMark,
    });

    int id;
    String address;
    String city;
    int shippingFees;
    String lat;
    String lang;
    String district;
    String building;
    String houseNumber;
    String landMark;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        address: json["address"],
        city: json["city"],
        shippingFees: json["shipping_fees"],
        lat: json["lat"] == null ? null : json["lat"],
        lang: json["lang"] == null ? null : json["lang"],
        district: json["district"] == null ? null : json["district"],
        building: json["building"] == null ? null : json["building"],
        houseNumber: json["house_number"] == null ? null : json["house_number"],
        landMark: json["land_mark"] == null ? null : json["land_mark"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "shipping_fees": shippingFees,
        "lat": lat == null ? null : lat,
        "lang": lang == null ? null : lang,
        "district": district == null ? null : district,
        "building": building == null ? null : building,
        "house_number": houseNumber == null ? null : houseNumber,
        "land_mark": landMark == null ? null : landMark,
    };
}
