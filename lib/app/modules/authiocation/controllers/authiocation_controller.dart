import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/api/model/user_model.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class AuthiocationController extends GetxController {
  TextEditingController fullName = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  @override
  void onInit() {
    phone.text = "0123456789";
    password.text = "123123123";
  }

  restbnt() {
    buttonController.stop();
  }

  createUser() {
    WebServices()
        .createUser(
            name: fullName.text,
            mobile: phone.text,
            email: email.text,
            password: password.text)
        .then((Response response) {
      if (response.body['success']) {
        final userModel = userModelFromJson(response.bodyString);

        showSnackBar(
          message: response.body['message'],
          title: appName,
          snackbarStatus: () {
            Get.toNamed(Routes.SigninView);
          },
        );
      } else {
        showSnackBar(
          message: response.body['errors'],
          title: appName,
          snackbarStatus: () {
            restbnt();
          },
        );
      }
    });
  }

  Signin() async {
    await WebServices()
        .signin(
      mobile: phone.text,
      password: password.text,
    )
        .then((Response response) {
      if (response.body['success']) {
        Get.find<UserAuth>()
            .setUserToken(response.body['data']['access_token'].toString());
        showSnackBar(
          message: response.body['message'],
          title: appName,
          snackbarStatus: () {
            buttonController.reset();
            Get.toNamed(Routes.LayoutView);
          },
        );
      } else {
        showSnackBar(
          message: response.body['errors'],
          title: appName,
          snackbarStatus: () {
            buttonController.reset();
          },
        );
      }
    });
  }
}
