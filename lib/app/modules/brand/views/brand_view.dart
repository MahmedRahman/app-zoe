import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/model/brand_model.dart';
import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class BrandView extends GetView<BrandController> {

  BrandController brandController = Get.put(BrandController());

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
        child: FutureBuilder(
            future: brandController.getBrand(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Brand> brands = snapshot.data;
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(brands.length, (index) {
                    return CachedNetworkImage(
                          imageUrl:
                             brands.elementAt(index).name.toString(),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        );
                    
                    // Text(brands.elementAt(index).name.toString());
                  }),
                );
              } else {
                return Text('No Data');
              }
            }),
      ),
    );
  }
}
