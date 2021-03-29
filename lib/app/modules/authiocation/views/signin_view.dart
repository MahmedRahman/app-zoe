import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/utils/AppTheme.dart';
import 'package:zoe/app/widget/CustomTextFormFiled.dart';

class SigninView extends GetView {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * .05),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: Get.height * .3,
                    child: SizedBox(
                      width: Get.width * .8,
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Login'.tr,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  CustomTextFormFiled(
                    inputHit: 'Telephone number'.tr,
                    inputLabel: 'Telephone number'.tr,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormFiled(
                    inputHit: 'password'.tr,
                    inputLabel: 'password'.tr,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ForgotpasswordView);
                      },
                      child: Text(
                        'forget your password?'.tr,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Text('Login'.tr),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SignupView);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'have an account'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'cairo',
                            ),
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
                                text: 'registration'.tr,
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
