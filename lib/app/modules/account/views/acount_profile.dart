import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';

class AcountProfile extends GetView<AccountController> {
  String Name;
  String Email;

  AcountProfile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بيانات الحساب',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'الاسم',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: TextFormField(
                  controller: controller.name,
                  decoration:
                      InputDecoration(enabledBorder: OutlineInputBorder(), focusedBorder: OutlineInputBorder() ),
                ),
              ),
              ListTile(
                title: Text(
                  'الايميل',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: TextFormField(
                  controller: controller.email,
                  decoration:
                      InputDecoration(enabledBorder: OutlineInputBorder(), focusedBorder: OutlineInputBorder() ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: Get.width * .9,
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateProfile();
                  },
                  child: Text('تعديل البيانات'),
                ),
              ),
              ListTile(
                title: Text(
                  'كلمة سر جديدة',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: TextFormField(
                  controller: controller.password,
                  decoration:
                      InputDecoration(border: OutlineInputBorder() , focusedBorder: OutlineInputBorder()  ),
                ),
              ),
              ListTile(
                title: Text(
                  'تاكيد كلمة السر',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                subtitle: TextFormField(
                  controller: controller.passwordConfirmation,
                  decoration:
                      InputDecoration(border: OutlineInputBorder(), focusedBorder: OutlineInputBorder() ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: Get.width * .9,
                child: ElevatedButton(
                  onPressed: () {
                    controller.changePassword();
                  },
                  child: Text('تغير كلمة السر'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
