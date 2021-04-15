import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/web_serives.dart';

import 'package:zoe/app/api/model/home_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectindex = 2.obs;
  final homeModelFuture = Future.value().obs;

  @override
  void onInit() async {
    await getHome();
    super.onInit();
  }

  Future getHome() async {
    HomeModel homeModel;
    Response response = await WebServices().getHomePage();
    if (response.hasError) {
      homeModelFuture.value = Future.error('error');
    } else {
      homeModel = homeModelFromJson(response.bodyString);
      homeModelFuture.value = Future.value(homeModel);
    }

    return homeModel;
  }
}
