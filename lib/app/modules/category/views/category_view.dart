import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/category/controllers/category_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CategoryView extends GetView {
  HomeController homeController = Get.put(HomeController());
  List<String> imageList = [
    'assets/brandList/1.png',
    'assets/brandList/2.png',
    'assets/brandList/3.png',
    'assets/brandList/4.png',
    'assets/brandList/5.png',
    'assets/brandList/7.png',
    'assets/brandList/6.png',
    'assets/brandList/8.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: Get.width * .3,
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(categoryList.length, (index) {
                return Flexible(
                  child: Container(
                    height: Get.height / 5,
                    color: categoryList.elementAt(index).color,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(categoryList.elementAt(index).img),
                        Text(
                          categoryList.elementAt(index).name,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            width: Get.width * .7,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                bottom: 25,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'جميع المنتجات',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text('العطور الرجالية'),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text('العطور النسائية'),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text('العطور للجنسيين'),
                      Divider(
                        color: Colors.grey,
                      ),
                      Text(
                        'الماركات',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      GridView.count(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(
                          imageList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.ProductCategoryView);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(imageList[index]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    )

        /* GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          homeController.getCategory().length,
          (index) => GestureDetector(
            onTap: () {
              Get.toNamed(Routes.ProductCategoryView);
            },
            child: 
            
            
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: homeController.getCategory().elementAt(index).color,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Image.asset(
                          homeController.getCategory().elementAt(index).img,
                        ),
                      ),
                      Text(
                        homeController.getCategory().elementAt(index).name,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),*/
        );
  }
}
