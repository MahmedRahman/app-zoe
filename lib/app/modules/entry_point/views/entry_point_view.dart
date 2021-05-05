import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';
import 'package:flutter/services.dart';
import '../controllers/entry_point_controller.dart';

class EntryPointView extends StatelessWidget {
  EntryPointController _entryPointController = Get.put(EntryPointController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          //color: Colors.red,
          image: DecorationImage(
            image: ExactAssetImage('assets/bg.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Center(
          child: Container(
    
            
            width: Get.width * .5,
            child: AnimatedDrawing.svg(
              "assets/logo002.svg",
              run: true,
              duration: new Duration(seconds: 4),
              onFinish: () {
              Get.offAndToNamed(Routes.LayoutView);
              },
            ),
          ),
        ),
      ),
    );
  }
}
