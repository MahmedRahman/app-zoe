import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/api/model/products_detaile_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class ProductDetailView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    var fav = true.obs;
    return Scaffold(
      appBar: CustemAppBar(),
      body: FutureBuilder(
        future: controller.getProductDetailes(Get.arguments[0].toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProductsDetaileModel productsDetaile = snapshot.data;
            fav.value = productsDetaile.data.product.wishlist;
            return ListView(
              children: [
                SizedBox(
                  height: Get.height * .4,
                  child: Stack(
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          productsDetaile.data.productImages.length == 0
                              ? Center(
                                  child: CustomIndicator(
                                    indicatorStatus: IndicatorStatus.error,
                                  ),
                                )
                              : CustomImageCached(
                                  imageUrl:
                                      productsDetaile.data.productImages[0],
                                ),
                        ],
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: CustomImageCached(
                                  imageUrl: productsDetaile.data.brand.image),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: Text(productsDetaile.data.product.name),
                  trailing: Text(
                    productsDetaile.data.product.price.toString() +
                        ' ' +
                        'ريال',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  leading: SizedBox(
                    width: 32,
                    child: Obx(() {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: fav.value ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          controller.SetFavoraitProduct(
                            productsDetaile.data.product.id.toString(),
                          );
                          if (fav.value) {
                            fav.value = false;
                          } else {
                            fav.value = true;
                          }
                          ;
                        },
                      );
                    }),
                  ),
                ),
                (productsDetaile.data.product.sizes.length != 0)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'الاحجام',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Column(
                  children: List.generate(
                    productsDetaile.data.product.sizes.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Obx(() {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                controller.productSizeSelect.value =
                                    index;
                                        
                              },
                              selected:
                                  controller.productSizeSelect.value == index,
                              selectedTileColor: Colors.grey,
                              title: Text(
                                productsDetaile.data.product.sizes
                                    .elementAt(index)
                                    .title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                productsDetaile.data.product.sizes
                                        .elementAt(index)
                                        .price
                                        .toString() +
                                    ' ' +
                                    'ريال',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
                (productsDetaile.data.product.colors.length != 0)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'اللون',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Column(
                  children: List.generate(
                    productsDetaile.data.product.colors.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Obx(() {
                          return Card(
                            child: ListTile(
                              onTap: () {
                                controller.productColorSelect.value =
                                   index;
                                        
                              },
                              selected:
                                  controller.productColorSelect.value == index,
                              selectedTileColor: Colors.grey,
                              title: Text(
                                productsDetaile.data.product.colors
                                    .elementAt(index)
                                    .title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                productsDetaile.data.product.colors
                                    .elementAt(index)
                                    .color
                                    .toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }),
                      );
                    },
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
                CustomButton(
                  title: 'أضف للسلة',
                  buttonController: controller.buttonController,
                  onPressed: () {
                    controller.productAddToCart(productsDetaile);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'منتجات مشابها',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: Get.height * .4,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      productsDetaile.data.similarProducts.length,
                      (indexproducts) {
                        SimilarProduct product = productsDetaile
                            .data.similarProducts
                            .elementAt(indexproducts);

                        return ProductItem(
                          product: product,
                        );
                      },
                    ),
                  ),
                )
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
        },
      ),
    );
  }
}
