import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/model/products_brand_model.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class ProductBrandView extends GetView<ProductController> {
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
      body: FutureBuilder(
        future: controller.getProductByBrand(Get.arguments[0].toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = snapshot.data;

            if (products.length == 0) {
              return Center(
                child: CustomIndicator(
                  indicatorStatus: IndicatorStatus.NoProductFound,
                ),
              );
            }
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
