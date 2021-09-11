import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:flutter/services.dart' show SystemChrome, rootBundle;

import 'package:zoe/app/api/model/home_model.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/modules/home/views/serech_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectindex = 2.obs;
  final homeModelFuture = Future.value().obs;

  TextEditingController serechval = new TextEditingController();

  @override
  void onInit() async {
    await getHome();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  getSearchProduct() async {
    ResponsModel responsModel =
        await WebServices().getSearchProduct(search: serechval.text);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['data'].length == 0) {

        Get.snackbar(appName, 'لا يوجد نتائج');
      
      } else {
      
       // Get.snackbar(appName, response.body['data'].length.toString());
        Get.to(Serech_view(response.body['data']),fullscreenDialog: true );
    
      
      }
    }
  }

  Future getHome() async {
    HomeModel homeModel;

    ResponsModel responsModel = await WebServices().getHomePage();
    if (responsModel.success) {
      Response response = responsModel.data;
      homeModel = homeModelFromJson(response.bodyString);
      homeModelFuture.value = Future.value(homeModel);
    }

    return homeModel;
  }

  Future<String> getJson() {
    return rootBundle.loadString('assets/home.json');
  }
}
