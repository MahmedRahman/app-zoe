import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/wish_list_model.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';

class AccountWishListView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustemAppBar(),
      body: FutureBuilder(
          future: controller.getWishList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                  List<Product> products = snapshot.data;
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
            return Center(child: CustomIndicator());
          }),
    );
  }
}
