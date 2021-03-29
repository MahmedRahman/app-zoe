import 'package:get/get.dart';

import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';

class AuthiocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthiocationController>(
      () => AuthiocationController(),
    );
  }
}
