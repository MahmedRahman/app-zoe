import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/modules/authiocation/views/signin_view.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';

class SplashView extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double fontsizeLarge = size.width * .05;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg.png'),
        )),
        child: Center(
          child: Column(
            children: [
              Container(
                height: size.height * .6,
                width: size.width *.7,
                child: Center(
                  child: AnimatedDrawing.svg(
                    "assets/logo001.svg",
                    run: true,
                    duration: new Duration(seconds: 3),
                    onFinish: () {
                     // print('OK');
                    },
                  ),
                ),
              ),
              Container(
                height: size.height * .4,
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    FittedBox(
                      child: ButtonTheme(
                        minWidth: size.width * .6,
                        buttonColor: Colors.red,
                        textTheme: ButtonTextTheme.primary,
                        child: 
                        CustomButton(title:  'Enter by phone number'.tr,onPressed: (){
                            Get.toNamed(Routes.SigninView);
                        },)
                       /* RaisedButton(
                         
                          child: Text(
                            'Enter by phone number'.tr,
                            style: headline2.copyWith(fontSize: 15),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.SigninView);
                          },
                        ),*/
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: size.width * .1,
                            child: Image.asset('assets/fb.png'),
                          ),
                          SizedBox(
                            width: size.width * .1,
                            child: Image.asset(
                              'assets/google.png',
                              width: size.width * .1,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .1,
                            child: Image.asset(
                              'assets/apple.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'or'.tr,
                      style: headline2,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.HOME);
                      },
                      child: Text(
                        'Log in visitor'.tr,
                        style: headline2,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
