import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/component/CustemDropdown.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/AppValidation.dart';
import 'package:zoe/app/data/map.dart';

import '../controllers/account_adress_add_controller.dart';

class AccountAdressAddView extends GetView<AccountAdressAddController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'أضافة عنوان جديد',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*   Text(
                      'المنطقة',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      onChanged: (index) {
                        Map provinances = index;

                        controller.cityMap.value = provinances['cities'];

                        controller.provinance = provinances["id"];
                      },
                      validator: (v) {
                        if (v == null) {
                          return 'برجاء المنطقة المناسبة';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'اختيار من المنطقة',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(
                        provinances.length,
                        (index) => DropdownMenuItem(
                          value: provinances.elementAt(index),
                          child:
                              Text('${provinances.elementAt(index)['title']}'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  */
                    Text(
                      'المدينة',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      onChanged: (index) {
                        controller.cityid = index;
                      },
                      validator: (v) {
                        if (v == null) {
                          return 'برجاء المدينة المناسبة';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'اختيار من المدينة',
                        border: OutlineInputBorder(),
                      ),
                      items: List.generate(
                        city.length,
                        (index) => DropdownMenuItem(
                          //print(controller.cityMap['cities'][0]['id']);
                          value: city.elementAt(index)['id'],
                          child: Text(
                            '${city.elementAt(index)['title']}',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'المعالم الرئيسية',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.land_mark,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'المعالم الرئيسية',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                      Text(
                      'العنوان',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                        TextFormField(
                      controller: controller.textaddress,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'العنوان',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(() {
                      return Text(
                        Kaddress.value,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff4C1711), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Get.to(MapScreen());
                    },
                    child: Text(
                      'الموقع على الخريطة',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState.validate()) {
                        controller.addAccountAdress();
                      }
                    },
                    child: Text('حفظ'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
