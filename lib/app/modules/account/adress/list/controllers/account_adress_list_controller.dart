import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';

class AccountAdressListController extends GetxController {

  final AdreesModel = Future.value().obs;

  getAccountAdress() async {
  ResponsModel responsModel  = await WebServices().getAccountAdress();
    if (responsModel.success) {
      Response response = responsModel.data;
    final accountAdreesModel = accountAdreesModelFromJson(response.bodyString);
    AdreesModel.value = Future.value(accountAdreesModel.data);
    }
  }

  deleteUserAddress({@required userAddresId}) async {
    ResponsModel responsModel =
        await WebServices().deleteUserAddress(userAddresId);

    if (responsModel.success) {
      Response response = responsModel.data;

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

}
