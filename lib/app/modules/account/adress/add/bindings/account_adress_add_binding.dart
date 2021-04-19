import 'package:get/get.dart';

import '../controllers/account_adress_add_controller.dart';

class AccountAdressAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAdressAddController>(
      () => AccountAdressAddController(),
    );
  }
}
