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

  TextEditingController address = new TextEditingController();
   RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  addAccountAdress() async {
    if (cityid == -1) {
      showSnackBar(
          title: appName,
          message: 'برجاء اختيار المدينة',
          snackbarStatus: () {
            buttonController.reset();
          });
    } else {
      ResponsModel responsModel =
          await WebServices().addAccountAdress(address.text, cityid);

      if (responsModel.success) {
        Response response = responsModel.data;
        showSnackBar(
            title: appName,
            message: response.body['message'],
            snackbarStatus: () {
              buttonController.reset();
              cityid = -1;
              address.text = "";

              Get.find<AccountAdressListController>().getAccountAdress();
            
            
              Get.back();
            });
      }
    }
  }

 void bntrest() {
    buttonController.reset();
  }

}
