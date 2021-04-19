import 'package:get/get.dart';

import '../controllers/account_order_list_controller.dart';

class AccountOrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountOrderListController>(
      () => AccountOrderListController(),
    );
  }
}
