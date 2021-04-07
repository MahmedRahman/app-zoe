import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/model/brand_model.dart';
import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class BrandView extends StatelessWidget {
  BrandController brandController = Get.put(BrandController());

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
                    Brand brand = brands.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ProductBrandView,
                            arguments: [brand.id.toString()]);
                      },
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomImageCached(
                          imageUrl: brand.image.toString(),
                        ),
                      )),
                    );

                    // Text(brands.elementAt(index).name.toString());
                  }),
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
      ),
    );
  }
}
