import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'package:zoe/app/component/CustomTextFormFiled.dart';

class ForgotpasswordView extends GetView {
  AuthiocationController controller = Get.put(AuthiocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                'assets/bg.png',
              ),
            ),
            Column(
              children: [
                Container(
                  height: Get.height * .3,
                  child: SizedBox(
                    width: Get.width * .8,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                Container(
                  width: Get.width * .9,
                  child: Text(
                    'Forgot your password'.tr,
                    style: TextStyle(
                      color: Color(0xff4C1711),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                CustomTextFormFiled(
                  inputController: controller.phone,
                  inputHit: 'البريد الالكترونى',
                  inputLabel: 'البريد الالكترونى',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * .9,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        controller.sendemailForgetPassword();
                      },
                      child: Text('send'.tr)),
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
                          text: 'I dont have an account'.tr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'cairo',
                          ),
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
                              text: 'registration'.tr,
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
          ],
        ),
      ),
    );
  }
}
