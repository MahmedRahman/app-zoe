import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'package:zoe/auth.dart';
import 'app/modules/entry_point/bindings/entry_point_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/data/helper/AppTranslation.dart';

void main() async {
  await GetStorage.init();
  await initServices();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      locale: Locale('ar', 'EG'),
      fallbackLocale: Locale('ar', 'EG'),
      title: appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: EntryPointBinding(),
      getPages: AppPages.routes,
      theme: AppTheme().themeData(),
    );
  }
}

initServices() async {
  await Get.putAsync<UserAuth>(() async => await UserAuth());
}
