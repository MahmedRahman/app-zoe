import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/helper/AppValidation.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'package:zoe/app/data/component/CustomTextFormFiled.dart';

class SigninView extends GetView<AuthiocationController> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fill,
          ),
        ),
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
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormFiled(
                          inputHit: 'Telephone number'.tr,
                          inputLabel: 'Telephone number'.tr,
                          keyboardType: TextInputType.number,
                          inputController: controller.phone,
                          onValidator: (value) {
                            return AppValidation.checkEmpty(value);
                          },
                        ),
                        CustomTextFormFiled(
                          inputHit: 'password'.tr,
                          inputLabel: 'password'.tr,
                          keyboardType: TextInputType.visiblePassword,
                          inputController: controller.password,
                          onValidator: (value) {
                            return AppValidation.checkEmpty(value);
                          },
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
                        CustomButton(
                          title: 'Login'.tr,
                          buttonController: controller.buttonController,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              controller.Signin();
                              
                            }
                          },
                        ),
                      ],
                    ),
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
