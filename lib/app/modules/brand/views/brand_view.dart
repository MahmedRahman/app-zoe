import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/brand_model.dart';
import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';

class BrandView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.put(BrandController());
    controller.getBrand();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<BrandController>(builder: (builder) {
          return FutureBuilder(
              future: controller.brandsList.value,
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
                          ),
                        ),
                      );
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
              });
        }),
      ),
    );
  }
}
