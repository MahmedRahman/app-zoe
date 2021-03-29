import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/routes/app_pages.dart';

class OrderPaymentView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: SizedBox(
            height: 100,
            child: Image.asset('assets/logo.png'),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.SplashView);
              },
            )
          ],
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('المنتجات'),
                subtitle: Text('5'),
                leading: Icon(
                  Icons.shopping_cart,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('المجموع'),
                subtitle: Text('3000   رس'),
                leading: Icon(
                  Icons.payment,
                  size: 32,
                  color: Colors.red,
                ),
              ),
            ),
            ListTile(
              title: Text('الأجمالى بعد الخصم'),
              trailing: Text('300'),
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
            ListTile(
              title: Text('البطاقة  الإتمانية'),
              leading: Image.asset('assets/payment/visa.png'),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('أدفع'),
            )
          ],
        ));
  }
}
