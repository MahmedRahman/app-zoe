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
                    color: Colors.grey,
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
                              category(Listdepartments),
                              Text(
                                'الماركات',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
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

  Widget department( DepartmentsPageModel Listdepartments) {
    return ListView(
      children: List.generate(Listdepartments.data.departments.length, (index) {
        var department = Listdepartments.data.departments.elementAt(index);
        return Obx(() {
          return Container(
            height: Get.height / Listdepartments.data.departments.length,
            color: categoryController.select_department.value == index
                ? Colors.white
                : Colors.grey,
            child: InkWell(
              onTap: () {
                categoryController.select_department.value = index;
                /*
                categoryController.getDepartmentCategoryandBrand(
                  department.id,
                );
                */
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
  }

  Widget category(DepartmentsPageModel Listdepartments) {
    return Obx(
      () {
        return Column(
          children: List.generate(
            Listdepartments.data.departments.elementAt(categoryController.select_department.value).categories.length,
            (index) => Container(
              width: Get.width,
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.ProductCategoryView,
                      arguments: [Listdepartments.data.departments.elementAt(categoryController.select_department.value).categories.elementAt(index).id.toString()]);
                },
                title: Text(
                  Listdepartments.data.departments.elementAt(categoryController.select_department.value).categories.elementAt(index).name,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget brand(DepartmentsPageModel Listdepartments) {
     return Obx(
        () {
         return GridView.count(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                      Listdepartments.data.departments.elementAt(categoryController.select_department.value).brands.length,
                      (index) => Card(
                        child: GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.ProductCategoryView);
                            Get.toNamed(Routes.ProductBrandView, arguments: [
                              Listdepartments.data.departments.elementAt(categoryController.select_department.value).brands.elementAt(index).id.toString()
                            ]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: CustomImageCached(
                                imageUrl: Listdepartments.data.departments.elementAt(categoryController.select_department.value).brands.elementAt(index).image ?? ''),
                          ),
                        ),
                      ),
                    ),
                  );
       }
     );
  }
}
