import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/adress/list/controllers/account_adress_list_controller.dart';

class AccountAdressAddController extends GetxController {
  //TODO: Implement AccountAdressAddController

  var cityName;
  int cityid = -1;
  int provinance = -1;

  var cityMap = [].obs;

  TextEditingController address = new TextEditingController();

  TextEditingController land_mark = new TextEditingController();
  TextEditingController district = new TextEditingController();
  TextEditingController building = new TextEditingController();
  TextEditingController house_number = new TextEditingController();

  
  TextEditingController textaddress = new TextEditingController();

  addAccountAdress() async {
    ResponsModel responsModel = await WebServices().addAccountAdress(
     GetUtils.isNullOrBlank(Kaddress.value) ? textaddress.text : Kaddress.value,
      cityid,
      landMark: land_mark.text,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        showSnackBar(
          title: appName,
          message: response.body['message'],
          snackbarStatus: () {
            cityid = -1;
            address.text = "";
            Get.find<AccountAdressListController>().getAccountAdress();
            Get.back();
          },
        );
      } else {
        showSnackBar(
          title: appName,
          message: 'we were unable to add a new address without using the map',
          snackbarStatus: () {},
        );
      }
    }
  }
}
