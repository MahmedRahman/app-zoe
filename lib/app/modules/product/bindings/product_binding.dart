import 'package:get/get.dart';

import 'package:zoe/app/modules/product/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(),
    );
  }
}
