import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {}

  getCategory() {
   return HomeProvider().getCategory();
  }

  getBrand() {
    return HomeProvider().getBrand();
  }

  getHome() {
    return HomeProvider().getHomePage();
  }
  List<ProductModel> getProduct() {
    return productLsit;
  }


  getFeaturedCategories() {
    return HomeProvider().getFeaturedCategories();
  }
  
}
