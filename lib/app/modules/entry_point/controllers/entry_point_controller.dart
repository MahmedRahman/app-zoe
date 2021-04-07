import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class EntryPointController extends GetxController {
  @override
  void onInit() {
    print('Entery Point');
         if (Get.find<UserAuth>().getUserToken() == null) {
                Get.toNamed(Routes.SplashView);
              } else {
                Get.toNamed(Routes.LayoutView);
              }
    super.onInit();
  }
}
