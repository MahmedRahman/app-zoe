import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
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
  Future<UserProfileModel> userProfile;

  TextEditingController address = new TextEditingController();
  int cityid = -1;

  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  @override
  void onInit() {
    getProfile();
    getAccountAdress();
    getCity();
  }

  getProfile() async {
    Response response = await WebServices().getProfile();
    final userProfileModel = userProfileModelFromJson(response.bodyString);

    userProfile = Future.value(userProfileModel);
  }

  getWishList() async {
    return await WebServices().getWishList().then((response) {
      final wishListModel = wishListModelFromJson(response.bodyString);
      return wishListModel.data.products;
    });
  }

  getOrderHistory() async {
    return await WebServices().getOrderHistory().then((response) {
      final orderHistoryModel = orderHistoryModelFromJson(response.bodyString);
      return orderHistoryModel.data;
    });
  }

  getCity() async {
    Response response = await WebServices().getCity();
    Cityllist = response.body['data'];
  }

  addAccountAdress() async {
    if (cityid == -1) {
      showSnackBar(
          title: appName,
          message: 'برجاء اختيار المدينة',
          snackbarStatus: () {
            buttonController.reset();
          });
    } else {
      return await WebServices()
          .addAccountAdress(address.text, cityid)
          .then((response) {
        showSnackBar(
            title: appName,
            message: response.body['message'],
            snackbarStatus: () {
              buttonController.reset();
              cityid = -1;
              address.text = "";
              getAccountAdress();
              Get.back();
            });
      });
    }
  }

  void bntrest() {
    buttonController.reset();
  }

  getOrderDetailesHistory(String Orderid) async {
    return await WebServices().getOrderDetailsHistory(Orderid).then((response) {
      print(response.bodyString);
      final orderHistoryDetailesModel =
          orderHistoryDetailesModelFromJson(response.bodyString);

      return orderHistoryDetailesModel.data;
    });
  }

  final AdreesModel = Future.value().obs;

  getAccountAdress() async {
    Response response = await WebServices().getAccountAdress();
    final accountAdreesModel = accountAdreesModelFromJson(response.bodyString);
    AdreesModel.value = Future.value(accountAdreesModel.data);
    return accountAdreesModel.data;
  }

  deleteUserAddress({@required userAddresId}) async {
    Response response = await WebServices().deleteUserAddress(userAddresId);

    if (response.body['success']) {
      showSnackBar(
        title: appName,
        message: 'تم الحذف',
        snackbarStatus: () {
          getAccountAdress();
        },
      );
    } else {
      showSnackBar(
        title: appName,
        message: response.body['message'],
        snackbarStatus: () {},
      );
    }
  }
}
