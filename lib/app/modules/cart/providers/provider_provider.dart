import 'dart:convert';

import 'package:get/get.dart';
import 'package:zoe/app/data/repostory.dart';

class CartProvider extends RepostoryProvide {
  Future checkout(String productsList, String qtyList) async {
    return await repPost(
      'checkout',
        {
          'products': productsList,
          'qty': qtyList,
          'pay_method': '1',
          'address': 2,
        },
      
    ).then((value) {
      print(value);
      return value;
    });
  }
}
