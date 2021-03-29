import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height*.5,
            child: Image.asset('assets/perfumeWoman/2.png'),
          ),
          Center(
            child: Text(
              'ProductView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
