import 'package:get/get.dart';

import 'package:zoe/app/modules/order/controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
      () => OrderController(),
    );
  }
}
