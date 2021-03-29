import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:zoe/app/modules/account/controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'قيد التنفيذ', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  