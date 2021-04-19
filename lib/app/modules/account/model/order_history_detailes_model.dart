// To parse this JSON data, do
//
//     final orderHistoryDetailesModel = orderHistoryDetailesModelFromJson(jsonString);

import 'dart:convert';

OrderHistoryDetailesModel orderHistoryDetailesModelFromJson(String str) => OrderHistoryDetailesModel.fromJson(json.decode(str));

String orderHistoryDetailesModelToJson(OrderHistoryDetailesModel data) => json.encode(data.toJson());

class OrderHistoryDetailesModel {
    OrderHistoryDetailesModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    Data data;
    int code;

    factory OrderHistoryDetailesModel.fromJson(Map<String, dynamic> json) => OrderHistoryDetailesModel(
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
        this.order,
        this.items,
    });

    Order order;
    List<Item> items;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        order: Order.fromJson(json["order"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order": order.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.id,
        this.name,
        this.qty,
        this.price,
        this.total,
        this.image,
        this.color,
        this.size,
    });

    int id;
    String name;
    int qty;
    var price;
    var total;
    String image;
    String color;
    String size;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        qty: json["qty"],
        price: json["price"],
        total: json["total"],
        image: json["image"],
        color: json["color"] == null ? null : json["color"],
        size: json["size"] == null ? null : json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qty": qty,
        "price": price,
        "total": total,
        "image": image,
        "color": color == null ? null : color,
        "size": size == null ? null : size,
    };
}

class Order {
    Order({
        this.id,
        this.orderDate,
        this.orderTotal,
        this.address,
        this.city,
        this.orderShippingFee,
        this.orderNotes,
        this.orderSubTotal,
        this.status,
    });

    int id;
    DateTime orderDate;
    var orderTotal;
    String address;
    String city;
    int orderShippingFee;
    String orderNotes;
    int orderSubTotal;
    String status;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: DateTime.parse(json["order_date"]),
        orderTotal: json["order_total"],
        address: json["address"],
        city: json["city"],
        orderShippingFee: json["order_shipping_fee"],
        orderNotes: json["order_notes"],
        orderSubTotal: json["order_sub_total"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "order_total": orderTotal,
        "address": address,
        "city": city,
        "order_shipping_fee": orderShippingFee,
        "order_notes": orderNotes,
        "order_sub_total": orderSubTotal,
        "status": status,
    };
}
