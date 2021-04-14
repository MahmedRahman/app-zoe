import 'package:flutter/material.dart';

class CartItem {
  int productid;
  String productName;
  String productimage;
  dynamic productPrice;
  int productSize;
  int productColor;
  int qty;
  dynamic totalprice;

  CartItem({
    @required this.productid,
    @required this.productName,
    @required this.productimage,
    @required this.productPrice,
    this.productSize = 0,
    this.productColor = 0,
    @required this.qty,
  }) {
    totalprice = productPrice * this.qty;
  }

  addQty({@required int qty}) {
    this.qty = this.qty + qty;
    totalprice = productPrice * this.qty;
  }
}
