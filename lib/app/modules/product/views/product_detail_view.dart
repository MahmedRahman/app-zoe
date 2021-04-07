import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/model/products_detaile_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class ProductDetailView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.getProductDetailes(Get.arguments[0].toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ProductsDetaileModel productsDetaile = snapshot.data;

              return ListView(
                children: [
                  SizedBox(
                    height: Get.height * .4,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        productsDetaile.data.productImages.length == 0
                            ? Center(
                                child: CustomIndicator(
                                  indicatorStatus: IndicatorStatus.error,
                                ),
                              )
                            : CustomImageCached(
                                imageUrl: productsDetaile.data.productImages[0],
                              ),
                        CustomImageCached(
                          imageUrl: productsDetaile.data.productImages[0],
                        )
                      ],
                    ),
                  ),

                  ListTile(
                    title: Text(productsDetaile.data.product.name),
                    trailing:
                        Text(productsDetaile.data.product.price.toString()),
                    leading: SizedBox(
                      width: 32,
                      child: CustomImageCached(
                        imageUrl: productsDetaile.data.brand.image,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'الوصف',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Html(
                      data: productsDetaile.data.product.desc.toString(),
                    ),
                  ),

              
                  ListTile(
                    leading: Text('الكمية'),
                    trailing: Text('1'),
                  ),
                  CustomButton(title: 'أضف للسلة',onPressed: (){

                          showSnackBar(
                            title: appName,
                            message: 'تم الاضافة الى سلة المشتريات',
                            snackbarStatus: () {
                              Get.find<CartController>().addToCart(new CartItem(
                                productimage:
                                    productsDetaile.data.productImages[0],
                                Productid: productsDetaile.data.product.id,
                                productName: productsDetaile.data.product.name,
                                ProductPrice:
                                    productsDetaile.data.product.price,
                                qty: 1,
                              ));
                              Get.toNamed(Routes.LayoutView);
                              Get.find<HomeController>().selectindex.value = 3;
                            },
                          );
                      },) 
                ],
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
          }),
    );
  }
}
