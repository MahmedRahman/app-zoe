import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';

class AccountAboutView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustemAppBar(),
      body: Center(
        child: Text(
          'AccountAboutView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
