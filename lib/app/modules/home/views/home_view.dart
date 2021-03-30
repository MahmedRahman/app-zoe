import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/model/home_model.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zoe/app/widget/CustomImageCached.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset('assets/offer.png'),
          SizedBox(
            height: 10,
          ),
          Title(
            label: 'الاقسام',
          ),
          buildCategory(),
          Title(
            label: 'الماركات',
          ),
          buildBrand(),
          FutureBuilder(
              future: controller.getFeaturedCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<FeaturedCategory> featuredCategories = snapshot.data;

                  return Column(
                    children: List.generate(
                      featuredCategories.length,
                      (indexCategory) {
                        return Column(
                          children: [
                            Title(
                              label: featuredCategories
                                  .elementAt(indexCategory)
                                  .name,
                              sublabel: 'المزيد',
                              categoryId:featuredCategories
                                  .elementAt(indexCategory).id.toString() ,
                            ),
                            SizedBox(
                              height: Get.height * .4,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  featuredCategories
                                      .elementAt(indexCategory)
                                      .products
                                      .length,
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
                } else {
                  return Text('No data');
                }
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  SizedBox buildBrand() {
    return SizedBox(
        height: Get.height * .1,
        child: FutureBuilder(
          future: controller.getBrand(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BrandElement> brandElement = snapshot.data;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandElement.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.ProductBrandView,arguments: [brandElement.elementAt(index).id.toString()]);
                      },
                      child: Container(
                        width: Get.width * .5,
                        height: Get.height * .2,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              brandElement.elementAt(index).image.toString(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),

                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }

  SizedBox buildCategory() {
    return SizedBox(
      height: Get.height * .1,
      child: FutureBuilder(
          future: controller.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BrandElement> brandElement = snapshot.data;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandElement.length,
                itemBuilder: (context, index) {
                  BrandElement CategoryItem = brandElement.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.ProductCategoryView,arguments:[CategoryItem.id.toString()]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: Get.width * .5,
                        height: Get.height * .2,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          leading: CustomImageCached(
                            imageUrl: CategoryItem.image,
                          ),
                          title: Text(CategoryItem.name),
                        ),
                      ),
                    ),
                  );
                },
              );

              //  Text('data vvvvvvvvvvvvvvvvvvvvv');
            } else {
              return CircularProgressIndicator();
            }
          }),
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

    print('object');
    print(product);

    return InkWell(
      onTap: (){
        Get.toNamed(Routes.ProductDetailView , arguments: [product.id.toString()]);
      },
      child: Container(
        width: Get.width / 3,
        child: Card(
          
          child: Column(
            children: [
              CustomImageCached(
                imageUrl: product.image.toString(),
              ),
              Text(product.name.toString()),
             // Text(product.brand.name.toString()),
              Text(product.price.toString()),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.right,
            ),
            InkWell(
              onTap: () {
                print(categoryId);
                Get.toNamed(Routes.ProductCategoryView,arguments: [categoryId]);
              },
              child: Text(
                sublabel ?? '',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
