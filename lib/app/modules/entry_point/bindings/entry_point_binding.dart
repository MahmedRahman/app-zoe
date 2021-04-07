import 'package:get/get.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/authiocation/controllers/authiocation_controller.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

import '../controllers/entry_point_controller.dart';

class EntryPointBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<EntryPointController>(
      () => EntryPointController(),
    );

  }
}
