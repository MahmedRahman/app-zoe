import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/modules/authiocation/views/splash_view.dart';
import 'package:zoe/app/modules/home/provider/home_provider.dart';

import '../controllers/entry_point_controller.dart';

class EntryPointView extends GetView<EntryPointController> {
  @override
  Widget build(BuildContext context) {

    //HomeProvider().getHomePage();
    return SplashView();
  }
}
