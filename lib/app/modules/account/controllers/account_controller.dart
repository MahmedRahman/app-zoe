import 'dart:convert';
import 'dart:math';

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
  var userProfile = Future.value().obs;

  TextEditingController address = new TextEditingController();

  TextEditingController name = new TextEditingController();

  TextEditingController email = new TextEditingController();

  TextEditingController password = new TextEditingController();

  TextEditingController passwordConfirmation = new TextEditingController();

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
      name.text = userProfileModel.data.name.toString();
      email.text = userProfileModel.data.email.toString();
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

  updateProfile() async {
    ResponsModel responsemodel =
        await WebServices().updateProfile(name.text, email.text);
    if (responsemodel.success) {
      Response response = responsemodel.data;
      if (response.body['success']) {
        Get.snackbar(appName, response.body['message']);
        getProfile();
      } else {
        Get.snackbar(appName, 'خطاء فى التحديث');
      }
    }
  }

  changePassword() async {
    ResponsModel responsemodel =
        await WebServices().changePassword(password.text, passwordConfirmation.text);
    if (responsemodel.success) {
      Response response = responsemodel.data;
      if (response.body['success']) {
        Get.snackbar(appName, response.body['message']);
        getProfile();
      } else {
        Get.snackbar(appName, 'خطاء فى التحديث');
      }
    }
  }

  void bntrest() {
    buttonController.reset();
  }
}
