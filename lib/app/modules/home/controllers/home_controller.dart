import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/productModel.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  

  List<CategoryModel> getCategory(){
    return categoryList;
  }


    List<BrandModel> getBrand(){
    return brandList;
  }

  List<ProductModel> getProduct(){
    return productLsit;
  }
}
