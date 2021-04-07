import 'package:flutter/material.dart';

class CartItem {
  int Productid;
  String productName;
   String productimage;
  double ProductPrice;
  int qty;
  double totalprice;

  CartItem({
    @required this.Productid,
    @required this.productName,
    @required this.productimage,
    @required this.ProductPrice,
    @required this.qty,
  }) {
    totalprice = ProductPrice * this.qty;
  }

  addQty({@required int qty}) {
    this.qty = this.qty + qty;
    totalprice = ProductPrice * this.qty;
  }
}
