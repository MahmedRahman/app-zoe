import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'package:zoe/app/data/component/CustomTextFormFiled.dart';

class OtpView extends GetView {
  AuthiocationController controller = Get.put(AuthiocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              child: Image.asset('assets/bg.png'),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                iconSize: 32,
                icon: Icon(Icons.close),
                onPressed: () {
                  Get.back(result: false);
                },
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
                    'Confirm phone number'.tr,
                    style: headline1,
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller:controller.codeSmsConfirem,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff4C1711),
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Color(0xff4C1711),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: RaisedButton(
                    onPressed: () {
                        FocusScope.of(context).unfocus();
                      controller.confiemSms();
                      // Get.toNamed(Routes.HOME);
                    },
                    child: Text(
                      'تأكيد',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: RaisedButton(
                    onPressed: () {
                      controller.setSmsCode();
                      // Get.toNamed(Routes.HOME);
                    },
                    child: Text(
                      'أعادة الارسال',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
