import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/api/model/category_products_model.dart';

class ProductDepartmentsView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: FutureBuilder(
        future: controller.getProductByDepartments(Get.arguments[0].toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<dynamic> products = snapshot.data;
            if (products.length == 0) {
              return Center(
                child: Text(
                  'لا يوجد منتجات',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: .6,
                  crossAxisCount: 2,
                  children: List.generate(
                    products.length,
                    (index) => ProductItem(
                      product: products.elementAt(index),
                    ),
                  ),
                ),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: CustomIndicator(
                indicatorStatus: IndicatorStatus.error,
              ),
            );
          }
          return Center(
            child: CustomIndicator(
              indicatorStatus: IndicatorStatus.ListProduct,
            ),
          );
        },
      ),
    );
  }
}
