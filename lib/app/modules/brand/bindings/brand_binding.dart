import 'package:get/get.dart';

import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';

class BrandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrandController>(
      () => BrandController(),
    );
  }
}
