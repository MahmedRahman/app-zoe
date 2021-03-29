import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/routes/app_pages.dart';

class ProductCategoryView extends GetView {
  HomeController _homeController = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: SizedBox(
          height: 100,
          child: Image.asset('assets/logo.png'),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Get.toNamed(Routes.SplashView);
            },
          )
        ],
      ),
      body: 
      
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          shrinkWrap: true,
          childAspectRatio: .6,
          crossAxisCount: 2,
          children: List.generate(
             _homeController.getProduct().length,
            (index) => ProductItem(
                product: _homeController.getProduct().elementAt(index),
              )
          ),
        ),
      ),
    );
  }
}
