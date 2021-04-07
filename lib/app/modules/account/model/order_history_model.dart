// To parse this JSON data, do
//
//     final orderHistoryModel = orderHistoryModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryModel orderHistoryModelFromJson(String str) => OrderHistoryModel.fromJson(json.decode(str));

String orderHistoryModelToJson(OrderHistoryModel data) => json.encode(data.toJson());

class OrderHistoryModel {
    OrderHistoryModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory OrderHistoryModel.fromJson(Map<String, dynamic> json) => OrderHistoryModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.orderDate,
        this.orderTotal,
        this.address,
        this.city,
    });

    int id;
    DateTime orderDate;
    double orderTotal;
    String address;
    String city;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderDate: DateTime.parse(json["order_date"]),
        orderTotal: json["order_total"].toDouble(),
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "order_total": orderTotal,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
    };
}
