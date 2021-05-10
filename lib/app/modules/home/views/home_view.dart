import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/home_model.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/component/CustomImageCached.dart';
import 'package:zoe/app/component/CustomIndicator.dart';

class HomePage extends StatelessWidget {
  // HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return FutureBuilder(
            future: controller.homeModelFuture.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                HomeModel homeModel = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * .25,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            homeModel.data.ads.length,
                            (index) {
                              return CustomImageCached(
                                imageUrl:
                                    homeModel.data.ads.elementAt(index).image,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: Get.width,
                          child: Text(
                            'الاقسام',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                      ),
                      buildDepartment(homeModel.data.departments),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomImageCached(
                                imageUrl: homeModel.data.bannerTwo,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomImageCached(
                                imageUrl: homeModel.data.bannerOne,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          width: Get.width,
                          child: Text(
                            'الماركات',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: KprimaryColor,
                            ),
                          ),
                        ),
                      ),
                      buildBrand(homeModel.data.brands),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomImageCached(
                                imageUrl: homeModel.data.bannerThree,
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildFeaturedCategory(homeModel.data.featuredCategories),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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
                  indicatorStatus: IndicatorStatus.wait,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildDepartment(List<BrandElement> brandElement) {
    return SizedBox(
        height: Get.height * .1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brandElement.length,
          itemBuilder: (context, index) {
            BrandElement CategoryItem = brandElement.elementAt(index);
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PRODUCT_LIST, arguments: [
                  CategoryItem.id.toString(),
                  ProductCategory.Department
                ]);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  width: Get.width * .5,
                  height: Get.height * .2,
                  decoration: BoxDecoration(
                      color: KLightGrayColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        )
                      ]),
                  child: Center(
                    child: ListTile(
                      dense: true,
                      leading: SizedBox(
                        width: 32,
                        height: 32,
                        child: CustomImageCached(
                          imageUrl: CategoryItem.image,
                        ),
                      ),
                      title: Text(
                        CategoryItem.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget buildBrand(List<BrandElement> brandElement) {
    return SizedBox(
      height: Get.height * .1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brandElement.length,
        itemBuilder: (context, index) {
          BrandElement brand = brandElement.elementAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PRODUCT_LIST,
                    arguments: [brand.id.toString(), ProductCategory.Brand]);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    width: Get.width * .5,
                    height: Get.height * .2,
                    decoration: BoxDecoration(
                        color: Color(0xffE1E1E0),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomImageCached(
                        imageUrl: brand.image.toString(),
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFeaturedCategory(List<FeaturedCategory> featuredCategories) {
    return Column(
      children: List.generate(
        featuredCategories.length,
        (indexCategory) {
          return Column(
            children: [
              Container(
                width: Get.width * .9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        featuredCategories.elementAt(indexCategory).name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.right,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.PRODUCT_LIST, arguments: [
                            featuredCategories
                                .elementAt(indexCategory)
                                .id
                                .toString(),
                            ProductCategory.Category
                          ]);
                        },
                        child: Text(
                          'المزيد' ?? '',
                          style: TextStyle(
                            color: Color(0xFF4C1711),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * .4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    featuredCategories.elementAt(indexCategory).products.length,
                    (indexproducts) {
                      Product product = featuredCategories
                          .elementAt(indexCategory)
                          .products
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
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.ProductDetailView,
          arguments: [product.id.toString()],
        );
      },
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: Get.width / 2,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        product.price.toString() + ' ' + 'ريال',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: KprimaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                       DiscountRate(product.priceBeforeDiscount , product.price) == 0
                          ? SizedBox.shrink()
                          : Text(
                              product.priceBeforeDiscount.toString() +
                                  ' ' +
                                  'ريال',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                         DiscountRate(product.priceBeforeDiscount , product.price)  == 0
                      ? SizedBox(
                          height: 30,
                        )
                      : Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: KprimaryColor,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'خصم  ${DiscountRate(product.priceBeforeDiscount , product.price)} %',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
   
        ],
      ),
    );
  }


  int DiscountRate(double priceBeforeDiscount,double price){
  if(priceBeforeDiscount >= price) {
    double discountPrice = priceBeforeDiscount - price ;
    int discountRate = ((discountPrice/ priceBeforeDiscount)*100).round() ;
   return discountRate;
  } else{
    return 0;
  }
}
}
