import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/home_model.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

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
                            height: 10,
                          ),
                          SizedBox(
                            height: Get.height * .3,
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                              children: List.generate(
                                homeModel.data.ads.length,
                                (index) {
                                  return SizedBox(
                                    width: Get.width,
                                    height: Get.height * .4,
                                    child: CustomImageCached(
                                      imageUrl: homeModel.data.ads
                                          .elementAt(index)
                                          .image,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                          Title(
                            label: 'الاقسام',
                          ),
                          buildCategory(homeModel.data.departments),
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
                          Title(
                            label: 'الماركات',
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
                          buildFeaturedCategory(
                              homeModel.data.featuredCategories),
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
                });
          }),
    );
  }

  Widget buildCategory(List<BrandElement> brandElement) {
    return SizedBox(
        height: Get.height * .1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: brandElement.length,
          itemBuilder: (context, index) {
            BrandElement CategoryItem = brandElement.elementAt(index);
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ProductDepartmentsView,
                    arguments: [CategoryItem.id.toString()]);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  width: Get.width * .5,
                  height: Get.height * .2,
                  decoration: BoxDecoration(
                      color: Color(0xffFEF2ED),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 2)
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
                            fontSize: 10, fontWeight: FontWeight.bold),
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
          BrandElement Brand = brandElement.elementAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ProductBrandView,
                    arguments: [Brand.id.toString()]);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    width: Get.width * .5,
                    height: Get.height * .2,
                    decoration: BoxDecoration(
                        color: Color(0xffFEF2ED),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 2)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomImageCached(
                        imageUrl: Brand.image.toString(),
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
              Title(
                label: featuredCategories.elementAt(indexCategory).name,
                sublabel: 'المزيد',
                categoryId:
                    featuredCategories.elementAt(indexCategory).id.toString(),
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

class Title extends StatelessWidget {
  const Title({
    this.label,
    this.sublabel,
    this.categoryId,
  });

  final String label;
  final String sublabel;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.right,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.ProductCategoryView,
                    arguments: [categoryId]);
              },
              child: Text(
                sublabel ?? '',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
