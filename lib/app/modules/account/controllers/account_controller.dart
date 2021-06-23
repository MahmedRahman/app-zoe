import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/modules/account/model/order_history_detailes_model.dart';
import 'package:zoe/app/modules/account/model/order_history_model.dart';
import 'package:zoe/app/modules/account/model/user_provile.dart';
import 'package:zoe/app/modules/account/model/wish_list_model.dart';

import 'package:zoe/app/routes/app_pages.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController
  var cityName;
  int cityid = -1;
  var userProfile= Future.value().obs;

  TextEditingController address = new TextEditingController();
  


  final wishListModelFuture = Future.value().obs;

  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  @override
  void onInit() {
    getProfile();
    
    //getCity();
  }

  getProfile() async {
    ResponsModel responsemodel = await WebServices().getProfile();

    if (responsemodel.success) {
      Response response = responsemodel.data;
      final userProfileModel = userProfileModelFromJson(response.bodyString);
      userProfile.value = Future.value(userProfileModel);
    }
  }

  getWishList() async {
    ResponsModel responsemodel = await WebServices().getWishList();

    if (responsemodel.success) {
      Response response = responsemodel.data;
      final wishListModel = wishListModelFromJson(response.bodyString);
      wishListModelFuture.value = Future.value(wishListModel.data.products);
      return wishListModel.data.products;
    }
  }

  getOrderHistory() async {
    ResponsModel responsemodel = await WebServices().getOrderHistory();
    if (responsemodel.success) {
      Response response = responsemodel.data;
      final orderHistoryModel = orderHistoryModelFromJson(response.bodyString);
      return orderHistoryModel.data;
    }
  }


/*
  getCity() async {
    ResponsModel responsemodel = await WebServices().getCity();
    if (responsemodel.success) {
      Response response = responsemodel.data;
      Cityllist = response.body['data'];
    }
  }
*/



  void bntrest() {
    buttonController.reset();
  }

}
