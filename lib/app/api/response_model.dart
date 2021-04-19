// To parse this JSON data, do
//
//     final responsModel = responsModelFromJson(jsonString);

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

ResponsModel responsModelFromJson(String str) => ResponsModel.fromJson(json.decode(str));

String responsModelToJson(ResponsModel data) => json.encode(data.toJson());

class ResponsModel {
    ResponsModel({
        @required this.success,
        this.data,
        @required this.code,
    });

    bool success;
    Response data;
    int code;

    factory ResponsModel.fromJson(Map<String, dynamic> json) => ResponsModel(
        success: json["success"],
        data: json["data"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "code": code,
    };
}
