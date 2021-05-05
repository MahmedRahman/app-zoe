import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class EntryPointController extends GetxController {
  @override
  void onInit() {
    SystemChrome.setEnabledSystemUIOverlays([]);

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    super.onClose();
  }
}
