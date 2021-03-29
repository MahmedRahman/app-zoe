import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/utils/AppTheme.dart';
import 'package:zoe/app/utils/AppValidation.dart';
import 'package:zoe/app/widget/CustomCheckBox.dart';
import 'package:zoe/app/widget/CustomTextFormFiled.dart';

class SignupView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: Get.height * .3,
                    child: SizedBox(
                      width: Get.width * .8,
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'new registration'.tr,
                      style: headline1,
                    ),
                  ),
                  CustomTextFormFiled(
                    inputHit: 'Full name'.tr,
                    inputLabel: 'Full name'.tr,
                    keyboardType: TextInputType.text,
                    onValidator: (value) {
                      return AppValidation.checkEmpty(value);
                    },
                  ),
                  CustomTextFormFiled(
                    inputHit: 'Telephone number'.tr,
                    inputLabel: 'Telephone number'.tr,
                    keyboardType: TextInputType.number,
                    onValidator: (value) {
                      return AppValidation.checkEmpty(value);
                    },
                  ),
                  CustomTextFormFiled(
                    inputHit: 'Email'.tr,
                    inputLabel: 'Email'.tr,
                    keyboardType: TextInputType.emailAddress,
                    onValidator: (value) {
                      return AppValidation.checkEmail(value);
                    },
                  ),
                  CustomTextFormFiled(
                    inputHit: 'password'.tr,
                    inputLabel: 'password'.tr,
                    keyboardType: TextInputType.text,
                    onValidator: (value) {
                      return AppValidation.checkEmpty(value);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.toNamed(Routes.OtpView);
                    },
                    child: Text('new registration'.tr),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SigninView);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'I dont have an account'.tr,
                            style: subtitle,
                            children: [
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: 'new registration'.tr,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
