import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/component/CustemDropdown.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomButton.dart';
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
                          return 'برجاء اختيار المدينة المناسبة';
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
                        Cityllist.length,
                        (index) => DropdownMenuItem(
                          value: Cityllist.elementAt(index)['id'],
                          child: Text('${Cityllist.elementAt(index)['title']}'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ألعنوان',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.address,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'التفاصيل',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'المعالم الرئيسية',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                      validator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ألمنطقة',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.district,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'ألمنطقة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
                    Text(
                      'بناء',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.building,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'بناء',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'رقم الدار',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: controller.house_number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'رقم الدار',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return AppValidation.checkEmpty(value);
                      },
                    ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff4C1711), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      Get.to(MapScreen());
                    },
                    child: Text('الموقع على الخريطة'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
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
