import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/model/department_category_brand_model.dart';
import 'package:zoe/app/api/model/department_model.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/data/CategoryModel.dart';
import 'package:zoe/app/data/component/CustomImageCached.dart';
import 'package:zoe/app/data/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/productModel.dart';
import 'package:zoe/app/modules/account/model/wish_list_model.dart';
import 'package:zoe/app/modules/category/controllers/category_controller.dart';
import 'package:zoe/app/modules/category/model/departments_page_model.dart';
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

    return GetX<CategoryController>(builder: (builder) {
      return FutureBuilder<Object>(
          future: categoryController.departments.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              DepartmentsPageModel Listdepartments = snapshot.data;
              return Scaffold(
                  body: Row(
                children: [
                  Container(
                    width: Get.width * .3,
                    color: KLightGrayColor,
                    child: department(Listdepartments),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              /* Text(
                                'الاقسام الفرعية',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.underline,
                                ),
                              ),*/
                              category(Listdepartments),
                              Divider(),
                              Text(
                                'أشهر الماركات',
                                style: TextStyle(
                                  color: Color(0xff4C1711),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              brand(Listdepartments),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
            }

            return Text('');
          });
    });
  }

  Widget department(DepartmentsPageModel Listdepartments) {
    return ListView(
      children: List.generate(
        Listdepartments.data.departments.length,
        (index) {
          var department = Listdepartments.data.departments.elementAt(index);
          return Obx(
            () {
              return Container(
                height: 50,
                color: categoryController.select_department.value == index
                    ? Colors.white
                    : KLightGrayColor,
                child: InkWell(
                  onTap: () {
                    categoryController.select_department.value = index;
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          department.name,
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: KprimaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget category(DepartmentsPageModel Listdepartments) {
    return Obx(() {
      return GridView.count(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(
          Listdepartments.data.departments
              .elementAt(categoryController.select_department.value)
              .categories
              .length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(color: KLightGrayColor),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.ProductCategoryView, arguments: [
                    Listdepartments.data.departments
                        .elementAt(categoryController.select_department.value)
                        .categories
                        .elementAt(index)
                        .id
                        .toString()
                  ]);
                },
                child: Column(
                  children: [
                    Expanded(
                      child: CustomImageCached(
                          imageUrl: Listdepartments.data.departments
                              .elementAt(
                                  categoryController.select_department.value)
                              .categories
                              .elementAt(index)
                              .image),
                    ),
                    Center(
                      child: Text(
                        Listdepartments.data.departments
                            .elementAt(
                                categoryController.select_department.value)
                            .categories
                            .elementAt(index)
                            .name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff4C1711),
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget brand(DepartmentsPageModel Listdepartments) {
    return Obx(() {
      return GridView.count(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(
          Listdepartments.data.departments
              .elementAt(categoryController.select_department.value)
              .brands
              .length,
          (index) => Card(
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.ProductCategoryView);
                Get.toNamed(Routes.ProductBrandView, arguments: [
                  Listdepartments.data.departments
                      .elementAt(categoryController.select_department.value)
                      .brands
                      .elementAt(index)
                      .id
                      .toString()
                ]);
              },
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: CustomImageCached(
                    imageUrl: Listdepartments.data.departments
                            .elementAt(
                                categoryController.select_department.value)
                            .brands
                            .elementAt(index)
                            .image ??
                        ''),
              ),
            ),
          ),
        ),
      );
    });
  }
}
