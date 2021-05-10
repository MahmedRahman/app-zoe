import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomImageCached.dart';
import 'package:zoe/app/component/CustomIndicator.dart';

import 'package:zoe/app/modules/account/controllers/account_controller.dart';
import 'package:zoe/app/modules/account/model/wish_list_model.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';

class AccountWishListView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    controller.getWishList();

    return Scaffold(
      appBar: CustemAppBar(),
      body: WillPopScope(
        onWillPop: () {
          print('xxxxxxxxx');
          return Future.value(true);
        },
        child: GetX<AccountController>(builder: (builder) {
          return FutureBuilder(
              future: controller.wishListModelFuture.value,
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
                        (index) => WishProductItem(
                          products.elementAt(index),
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
              });
        }),
      ),
    );
  }

  Widget WishProductItem(dynamic product) {
    return InkWell(
      onTap: () async {
        var data = await Get.toNamed(
          Routes.ProductDetailView,
          arguments: [product.id.toString()],
        );

        controller.getWishList();
      },
      child: Container(
        width: Get.width / 2,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 200,
                    child: CustomImageCached(
                      imageUrl: product.image ?? '',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  product.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                product.price.toInt().toString() + ' ' + 'ريال',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
