import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class BrandView extends GetView {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(
            imageList.length,
            (index) => GestureDetector(
              onTap: () {
                Get.toNamed(Routes.ProductCategoryView);
              },
              child: Image.asset(imageList[index]),
            ),
          ),
        ),
      ),
    );
  }
}
