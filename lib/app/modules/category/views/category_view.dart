import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/department_category_brand_model.dart';
import 'package:zoe/app/api/model/department_model.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/account/model/wish_list_model.dart';
import 'package:zoe/app/modules/category/controllers/category_controller.dart';
import 'package:zoe/app/modules/home/controllers/home_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';

class CategoryView extends GetView {

  CategoryController categoryController;

  @override
  Widget build(BuildContext context) {

   Get.lazyPut<CategoryController>(() {
      return CategoryController();
    });
 categoryController = Get.find<CategoryController>();

    return Scaffold(
        body: Row(
      children: [
        Container(
          width: Get.width * .3,
          color: Colors.grey,
          child: department(),
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
                      'الاقسام الفرعية',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    category(),
                    Text(
                      'الماركات',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                      brand(),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  GetX<CategoryController> department() {
    return GetX<CategoryController>(
      builder: (context) {
        return FutureBuilder(
          future: categoryController.departments.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var Listdepartments = snapshot.data;
              return ListView(
                children: List.generate(Listdepartments.length, (index) {
                  var department = Listdepartments.elementAt(index);
                  return Obx(() {
                    return Container(
                      height: Get.height / Listdepartments.length,
                      color:
                          categoryController.select_department.value == index
                              ? Colors.white
                              : Colors.grey,
                      child: InkWell(
                        onTap: () {
                          categoryController.select_department.value = index;
                          categoryController.getDepartmentCategoryandBrand(
                            department.id,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 32,
                              child: CustomImageCached(
                                imageUrl: department.image,
                              ),
                            ),
                            Text(
                              department.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
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
    );
  }

  GetX<CategoryController> category() {
    return GetX<CategoryController>(builder: (builder) {
      return FutureBuilder(
          future: categoryController.categories.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> categoriesList;
              categoriesList = snapshot.data;

              return Column(
                children: List.generate(
                  categoriesList.length,
                  (index) => Container(
                    width: Get.width,
                    child: ListTile(
                      onTap: () {
                        Get.toNamed(Routes.ProductCategoryView, arguments: [
                          categoriesList.elementAt(index).id.toString()
                        ]);
                      },
                      title: Text(
                        categoriesList.elementAt(index).name,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return CustomIndicator();
            }
            return CustomIndicator();
          });
    });
  }

  GetX<CategoryController> brand() {
    return GetX<CategoryController>(builder: (builder) {
      return FutureBuilder(
          future: categoryController.brands.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> BrandsList;
              BrandsList = snapshot.data;
              return GridView.count(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  BrandsList.length,
                  (index) => Card(
                    child: GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.ProductCategoryView);
                        Get.toNamed(Routes.ProductBrandView, arguments: [
                          BrandsList.elementAt(index).id.toString()
                        ]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: CustomImageCached(
                            imageUrl: BrandsList.elementAt(index).image ?? ''),
                      ),
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return CustomIndicator();
            }
            return CustomIndicator();
          });
    });
  }
}
