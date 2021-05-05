import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/component/CustomAppBar.dart';
import 'package:zoe/app/data/component/CustomButton.dart';
import 'package:zoe/app/api/model/products_detaile_model.dart' as productsModel;
import 'package:flutter_html/flutter_html.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:badges/badges.dart';

class ProductDetailView extends StatelessWidget {
  ProductController controller = Get.put(ProductController());
  PageController _pageController = PageController();
//Get.arguments[0].toString()130

  @override
  Widget build(BuildContext context) {
    controller.getProductDetailes(Get.arguments[0].toString());
    var fav = true.obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        actions: [
          InkWell(
            onTap: () {
                Kselectindex.value = 3;
              Get.offAllNamed(Routes.LayoutView);
            
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Badge(
                badgeColor: Colors.black,
                badgeContent: Obx(() {
                  return Text(
                    Get.find<CartController>().shopCount.value.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                }),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: GetX<ProductController>(builder: (controller) {
        return FutureBuilder(
          future: controller.productsDetaileModelFuture.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              productsModel.ProductsDetaileModel productsDetaile =
                  snapshot.data;
              fav.value = productsDetaile.data.product.wishlist;
              controller.ProductPrice.value =
                  productsDetaile.data.product.price.toDouble();
              return ListView(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height * .4,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            productsDetaile.data.productImages.length,
                            (index) {
                              return SizedBox(
                                width: Get.width,
                                height: Get.height * .4,
                                child: CustomImageCached(
                                  imageUrl:
                                      productsDetaile.data.productImages[index],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        Positioned(
                          top: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.ProductBrandView, arguments: [
                                productsDetaile.data.brand.id.toString()
                              ]);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 64,
                                  height: 64,
                                  child: CustomImageCached(
                                    imageUrl: productsDetaile.data.brand.image,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Obx(() {
                            return IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: fav.value ? Color(0xFF4C1711) : Colors.grey,
                                size: 32,
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
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      productsDetaile.data.product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Obx(() {
                      return Text(
                        controller.ProductPrice.toString() + ' ' + 'ريال',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C1711),
                        ),
                      );
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      productColorBox(productsDetaile),
                    ],
                  ),
                  productSizeBox(productsDetaile),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'الكمية',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C1711),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          controller.addproductQty();
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C1711),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(() {
                        return Text(
                          controller.productQty.value.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        );
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          controller.removeproductQty();
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C1711),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.productAddToCart(productsDetaile);
                      },
                      icon: Icon(Icons.shopping_cart_rounded),
                      label: Text(
                        'أضف للسلة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )

                    /*
                    (
                      onPressed: () {
                        controller.productAddToCart(productsDetaile);
                      },
                      child: Text(
                        'أضف للسلة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                    */
                    ,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  productDetailesInfo(productsDetaile),
                  similarProducts(productsDetaile: productsDetaile),
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
        );
      }),
      //  bottomNavigationBar: custembottomNavigationBar(),
    );
  }

  Widget productColorBox(productsModel.ProductsDetaileModel productsDetaile) {
    return (productsDetaile.data.product.colors.length != 0)
        ? Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                productsDetaile.data.product.colors.length,
                (index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {


                        _pageController.animateTo(
                            productsDetaile.data.productImages
                                .indexOf(productsDetaile.data.product.colors
                                    .elementAt(index)
                                    .image)
                                .toDouble(),
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);

               
                        controller.productColorSelect.value = index;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 32,
                          height: 32,
                          child: SizedBox.shrink(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(HexColorFormString().getColorFromHex(
                                  productsDetaile.data.product.colors
                                      .elementAt(index)
                                      .color)),
                              border: controller.productColorSelect.value ==
                                      index
                                  ? Border.all(color: Colors.black, width: 2)
                                  : Border.all(
                                      color: Color(HexColorFormString()
                                          .getColorFromHex(productsDetaile
                                              .data.product.colors
                                              .elementAt(index)
                                              .color)),
                                      width: 2),
                              boxShadow: [
                                controller.productColorSelect.value == index
                                    ? BoxShadow(
                                        color: Colors.grey.withOpacity(0.8),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    : BoxShadow()
                              ]),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget productSizeBox(productsModel.ProductsDetaileModel productsDetaile) {
    return (productsDetaile.data.product.sizes.length != 0)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: List.generate(
                      productsDetaile.data.product.sizes.length, (index) {
                return Obx(() {
                  return InkWell(
                    onTap: () {
                      controller.productSizeSelect.value = index;
                      controller.ProductPrice.value = productsDetaile
                          .data.product.sizes
                          .elementAt(index)
                          .price
                          .toDouble();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              productsDetaile.data.product.sizes
                                  .elementAt(index)
                                  .title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: controller.productSizeSelect.value == index
                              ? Colors.grey.withOpacity(.5)
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                });
              })),
            ],
          )
        : SizedBox.shrink();
  }

  Widget productDetailesInfo(
      productsModel.ProductsDetaileModel productsDetaile) {
    return DefaultTabController(
      length: 2, // length of tabs
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: TabBar(
              labelColor: Color(0xFF4C1711),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'الوصف'),
                Tab(text: 'الخصائص'),
              ],
            ),
          ),
          Container(
            height: 400, //height of TabBarView
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: TabBarView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    primary: false,
                    children: [
                      Container(
                        child: Html(
                          data: productsDetaile.data.product.desc.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: List.generate(
                        productsDetaile.data.specifications.length, (index) {
                      return ListTile(
                        title: Text(
                          productsDetaile.data.specifications
                              .elementAt(index)
                              .title
                              .toString(),
                        ),
                        subtitle: Text(
                          productsDetaile.data.specifications
                              .elementAt(index)
                              .value
                              .toString(),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class similarProducts extends StatelessWidget {
  const similarProducts({
    Key key,
    @required this.productsDetaile,
  }) : super(key: key);

  final productsModel.ProductsDetaileModel productsDetaile;

  @override
  Widget build(BuildContext context) {
    return productsDetaile.data.similarProducts.length == 0
        ? SizedBox.shrink()
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'منتجات مقترحة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
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
                      productsModel.SimilarProduct product = productsDetaile
                          .data.similarProducts
                          .elementAt(indexproducts);

                      return ProductItem_detailes(
                        product: product,
                      );
                    },
                  ),
                ),
              )
            ],
          );
  }
}

class ProductItem_detailes extends StatelessWidget {
  const ProductItem_detailes({
    Key key,
    @required this.product,
  }) : super(key: key);

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAndToNamed(
          Routes.ProductDetailView,
          arguments: [product.id.toString()],
        );
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

class HexColorFormString {
  int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 3) {
      hexColor = "FF" + hexColor + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
