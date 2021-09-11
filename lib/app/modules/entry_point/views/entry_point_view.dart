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
    return Container(


              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
              Color(0xff362711),
              Color(0xff6d534b),
              Color(0xff9d878b),
              Color(0xffcac2c8),
              Color(0xff9d878b),
            ])

/*
              image: DecorationImage(
                image: ExactAssetImage('assets/bg.jpg'),
                fit: BoxFit.cover,
              ),
              */
                ),

      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
      
            ),
          ),
          Positioned(
            top: 1,
            left: 1,
            right: 1,
            bottom: 1,
            child: SizedBox(
              height: 100,
              width: Get.width * .5,
              child: Container(
                // color: Colors.red,

                child: AnimatedDrawing.svg(
                  "assets/logo002.svg",
                  run: true,
                  width: Get.width * .5,
                  duration: new Duration(seconds: 4),
                  onFinish: () {
                    Get.offAndToNamed(Routes.LayoutView);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
