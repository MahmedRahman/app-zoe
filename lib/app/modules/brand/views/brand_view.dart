import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/brand_model.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/modules/brand/controllers/brand_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/app/component/CustomImageCached.dart';
import 'package:zoe/app/component/CustomIndicator.dart';

class BrandView extends StatelessWidget {
  BrandController controller = Get.put(BrandController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            onChanged: (value) {
              print(value);
              controller.getSerechBrand(value);
            },
            decoration: InputDecoration(
              hintText: 'بحث ..',
              filled: true,
              fillColor: Colors.grey[300],
              suffixIcon: Icon(Icons.search_sharp),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetX<BrandController>(
          builder: (builder) {
            return FutureBuilder(
              future: controller.brandsList.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Brand> brands = snapshot.data;
                  print('Brand ${brands.length}');
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      brands.length,
                      (index) => bulidBrand(brands.elementAt(index)),
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
                    indicatorStatus: IndicatorStatus.ListProduct,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget bulidBrand(Brand brand) => InkWell(
        onTap: () {
          Get.toNamed(Routes.PRODUCT_LIST,
              arguments: [brand.id.toString(), ProductCategory.Brand]);
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
}
