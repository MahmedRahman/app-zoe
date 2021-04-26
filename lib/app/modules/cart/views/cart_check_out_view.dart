import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/account/adress/list/controllers/account_adress_list_controller.dart';
import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CartCheckOutView extends GetView<CartController> {
  String _character;

  
  var addressid = 3.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: Container(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('عدد المنتجات'),
                trailing: Text(controller.cartCount().toString()),
                leading: Icon(
                  Icons.shopping_cart,
                  size: 32,
                  color: Color(0xff4C1711),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('السعر'),
                trailing: Text(
                  controller.cartTotalProductPrice().toStringAsFixed(0) +
                      ' ' +
                      'ريال',
                ),
                leading: Icon(
                  Icons.payment,
                  size: 32,
                  color: Color(0xff4C1711),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الشحن'),
                trailing: Text(
                    controller.shappingPrice.value.toString() + ' ' + 'ريال'),
                leading: Icon(
                  Icons.car_rental,
                  size: 32,
                  color:  Color(0xff4C1711),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('الضريبة'),
                trailing: Text('0'),
                leading: Icon(
                  Icons.money_off,
                  size: 32,
                  color: Color(0xff4C1711),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text(
                'الإجمالى',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.cartTotalPrice().toString() + ' ' + 'ريال',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'طريقة الدفع',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            ListTile(
              title: Text('الدفع عند الاستلام'),
              leading: Image.asset('assets/payment/cash.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'العنوان',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
           addressWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.ACCOUNT_ADRESS_ADD);
                  },
                  child: Text(
                    'أضف عنون جديد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            CustomButton(
              buttonController: controller.buttonController,
              title: 'اتمام عملية الشراء',
              onPressed: () {
                controller.checkout();
              },
            ),   SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget addressWidget() {
    AccountAdressListController _accountController = Get.put(AccountAdressListController());
    _accountController.getAccountAdress();
    return GetX<AccountAdressListController>(

      builder: (_accountController) {
      return FutureBuilder(
          future: _accountController.AdreesModel.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> AddressList = snapshot.data;
              AddressList.sort((b, a) => a.id.compareTo(b.id));
              return Column(
                  children: List.generate(AddressList.length, (index) {
                Datum Address = AddressList.elementAt(index);
                if (index == 0) {
                  addressid.value = Address.id;
                  controller.addressid = Address.id;
                  controller.shappingPrice.value = Address.shippingFees;
                }

                return Obx(() {
                  return RadioListTile(
                    title: Text(Address.address.toString()),
                    subtitle: Text(Address.city.toString()),
                    value: Address.id,
                    groupValue: addressid.value,
                    onChanged: (int value) {
                      addressid.value = value;
                      controller.addressid = value;
                      controller.shappingPrice.value = Address.shippingFees;
                      print(controller.shappingPrice.value);
                    },
                  );
                });
              }).toList());
            } else if (snapshot.hasError) {
              return Center(
                child: CustomIndicator(
                  indicatorStatus: IndicatorStatus.error,
                ),
              );
            }
            return Center(child: CustomIndicator());
          });
    });
  }
}
