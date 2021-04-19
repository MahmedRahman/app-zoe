import 'package:get/get.dart';

import '../controllers/account_adress_list_controller.dart';

class AccountAdressListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountAdressListController>(
      () => AccountAdressListController(),
    );
  }
}
