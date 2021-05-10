import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class EntryPointController extends GetxController {
  
  @override
  void onInit() {
    super.onInit();
  // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  
  @override
  void onClose() {
    // TODO: implement onClose
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.onClose();
  }

}
