import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'package:zoe/app/data/helper/AppValidation.dart';
import 'package:zoe/app/component/CustomCheckBox.dart';
import 'package:zoe/app/component/CustomTextFormFiled.dart';

class SignupView extends GetView<AuthiocationController> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
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
                      inputController: controller.fullName,
                      onValidator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
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
                      inputHit: 'Email'.tr,
                      inputLabel: 'Email'.tr,
                      keyboardType: TextInputType.emailAddress,
                      inputController: controller.email,
                      onValidator: (value) {
                        return AppValidation.checkEmail(value);
                      },
                    ),
                    CustomTextFormFiled(
                      inputHit: 'password'.tr,
                      inputLabel: 'password'.tr,
                      keyboardType: TextInputType.text,
                      inputController: controller.password,
                      onValidator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: Get.width * .9,
                      child: ElevatedButton(
                        child: Text(
                          'new registration'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //title: ,
                        // buttonController: controller.buttonController,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            //FocusScope.of(context).unfocus();
                            controller.createUser();
                          }
                        },
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
                            Get.toNamed(Routes.SigninView);
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'لديك حساب '.tr,
                              style: subtitle,
                              children: [
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: Color(0xff4C1711),
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: 'تسجيل دخول'.tr,
                                  style: TextStyle(
                                    color: Color(0xff4C1711),
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
      ),
    );
  }
}
