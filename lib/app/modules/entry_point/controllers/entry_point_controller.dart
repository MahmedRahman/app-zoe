import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class EntryPointController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    WebServices().getPayMethods().then((value) {
      if (value.success) {
        Response response = value.data;
        if (response.body['success']) {
          delivery_fees =response.body['data'];
          additionalFees = response.body['data'][0]['additional_fees'];
        }
      }
    });

    WebServices().getOrderExtraInfo().then((value) {
      if (value.success) {
        Response response = value.data;
        if (response.body['success']) {
          tax = response.body['data']['tax'];
          if (response.body['data']['free_shipping']['active']) {
            freeshipingamount = response.body['data']['free_shipping']['amount'];
           
          }
        }
      }
    });

    WebServices().getcities().then((value) {
      if (value.success) {
        Response response = value.data;
        if (response.body['success']) {
          city = response.body['data'];
        }
      }
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.onClose();
  }
}
