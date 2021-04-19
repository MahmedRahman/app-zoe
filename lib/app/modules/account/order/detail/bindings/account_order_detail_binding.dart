import 'package:get/get.dart';

import '../controllers/account_order_detail_controller.dart';

class AccountOrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountOrderDetailController>(
      () => AccountOrderDetailController(),
    );
  }
}
