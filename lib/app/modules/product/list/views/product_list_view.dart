import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';

import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  ProductListController controller = Get.put(ProductListController());
  var data = Get.arguments;
  ProductListView() {
    if (data[1] == ProductCategory.Department) {
      controller.getProductByDepartments(data[0]);
    }
    if (data[1] == ProductCategory.Brand) {
      controller.getProductByBrand(data[0]);
    }
    if (data[1] == ProductCategory.Category) {
      controller.getProductByCategory(data[0]);
    }

     if (data[1] == ProductCategory.Offers) {
      controller.getProductOffers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        onChanged: (value) {
                          controller.getSerechProduct(value);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 15,
                            bottom: 11,
                            top: 11,
                            right: 15,
                          ),
                          enabledBorder: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                          hintText: 'بحث .....',
                          filled: true,
                          fillColor: Colors.grey[300],
                        )),
                  ),
                  // IconButton(icon: Icon(Icons.search_sharp), onPressed: () {})
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(60),
        ),
      ),
      body: GetX<ProductListController>(builder: (builder) {
        return SafeArea(
          child: FutureBuilder(
            future: controller.productsList.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> products = snapshot.data;

                if (products.length == 0) {
                  return Center(
                      child: Text(
                    'لا يوجد منتجات',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: KprimaryColor,
                    ),
                  ));
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: .6,
                    crossAxisCount: 2,
                    children: List.generate(products.length, (index) {
                      print('xxxxxxxxxxxx');
                      products.elementAt(index);
                      return ProductItem(
                        product: products.elementAt(index),
                      );
                    }),
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
      }),
    );
  }
}
