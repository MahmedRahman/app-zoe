import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

import '../controllers/entry_point_controller.dart';

class EntryPointView extends StatelessWidget {
  EntryPointController _entryPointController = Get.put(EntryPointController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.white,
          height: Get.height,
          width: Get.width * .5,
          child: AnimatedDrawing.svg(
            "assets/logo001.svg",
            run: true,
            duration: new Duration(seconds: 3),
            onFinish: () {
              if (Get.find<UserAuth>().getUserToken() == null) {
                Get.offNamed(Routes.SplashView);
              } else {
                Get.offNamed(Routes.LayoutView);
              }
            },
          ),
        ),
      ),
    );
  }
}
