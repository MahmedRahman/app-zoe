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

  TextEditingController land_mark = new TextEditingController();
  TextEditingController district = new TextEditingController();
  TextEditingController building = new TextEditingController();
  TextEditingController house_number = new TextEditingController();



  addAccountAdress() async {
    ResponsModel responsModel = await WebServices().addAccountAdress(
        address.text,
        cityid,
        land_mark.text,
        district.text,
        building.text,
        house_number.text);

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
        
        print(response.body['errors']);
      }
    }
  }


}
