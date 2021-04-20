import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/home/views/layout_view.dart';
import 'package:zoe/app/modules/product/views/product_detail_view.dart';
import 'package:zoe/auth.dart';
var Cityllist;


    List<Widget> stack = [
      CategoryView(),
      BrandView(),
      HomePage(),
      CartView(),
      (Get.find<UserAuth>().getUserToken() == null)
          ? loginuser()
          : AccountView(),
     
    ];