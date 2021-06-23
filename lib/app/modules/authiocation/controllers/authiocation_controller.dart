import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/api/model/user_model.dart';
import 'package:zoe/app/modules/authiocation/views/otp_view.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class AuthiocationController extends GetxController {
  var codeSms = '5555';
  TextEditingController codeSmsConfirem = new TextEditingController();
  TextEditingController fullName = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  @override
  void onInit() {}

  restbnt() {
    buttonController.stop();
  }

  signin() async {
    ResponsModel responsModel = await WebServices().signin(
      mobile: phone.text,
      password: password.text,
    );

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['success']) {
        if (response.body['verified']) {
          Get.find<UserAuth>().setUserToken(
            response.body['data']['access_token'].toString(),
          );

          Kselectindex = 2.obs;

          Get.offAllNamed(Routes.LayoutView);
        } else {
          Get.toNamed(Routes.OtpView);
        }
      } else {
        Get.snackbar(appName, response.body['errors']);
      }
    } else {}
  }

  createUser() async {
    ResponsModel responsModel = await WebServices().createUser(
      name: fullName.text,
      mobile: phone.text,
      email: email.text,
      password: password.text,
    );

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        final userModel = userModelFromJson(response.bodyString);

        showSnackBar(
          message:
              '${response.body['message']} ',
          title: appName,
          snackbarStatus: () {
            Get.toNamed(Routes.SigninView);
          },
        );
      } else {
        showSnackBar(
          message: response.body['errors'],
          title: appName,
          snackbarStatus: () {},
        );
      }
    }
  }

  Future<bool> SendSmsCode() async {
    ResponsModel responsModel = await WebServices().setSmsCode(phone.text);

    if (responsModel.success) {
      Response response = responsModel.data;
      //print(response.body['errors']);

      if (response.body['success']) {
        codeSms = response.body['message'];
        Get.snackbar('Sms', 'تم ارسال الكود');
        return true;
      } else {
        Get.snackbar('Sms', response.body['errors']);
        return false;
      }
    }
  }

  confiemSms() async {
    ResponsModel responsModel =
        await WebServices().vertificationCode(phone.text, codeSmsConfirem.text);

    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        signin();
      } else {
        Get.snackbar('Sms', response.body['message']);
      }
    }
  }
}
