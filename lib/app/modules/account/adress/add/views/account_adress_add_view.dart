import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/component/CustemDropdown.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomButton.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/AppValidation.dart';

import '../controllers/account_adress_add_controller.dart';

class AccountAdressAddView extends GetView<AccountAdressAddController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'المدينة',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                CustomDropdownButton(
                  dropdownDate: Cityllist,
                  onChanged: (value) {
                    controller.cityid = int.parse(value.toString());
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'العنوان بالتفاصيل',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  controller: controller.address,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 14),
                    labelText: '',
                    labelStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  validator: (value) {
                    return AppValidation.checkEmpty(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'حفظ',
                  buttonController: controller.buttonController,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState.validate()) {
                      controller.addAccountAdress();
                    } else {
                      controller.bntrest();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



}
