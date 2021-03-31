import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppTheme.dart';
import 'app/routes/app_pages.dart';
import 'app/data/helper/AppTranslation.dart';

void main() {
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
      getPages: AppPages.routes,
      theme: AppTheme().themeData(),
    );
  }
}

