import 'package:get/get.dart';
import 'package:zoe/app/api/model/department_category_brand_model.dart';
import 'package:zoe/app/api/model/department_model.dart';
import 'package:zoe/app/api/web_serives.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  final count = 0.obs;

  var departments = Future.value().obs;
  var brands = Future.value().obs;
  var categories = Future.value().obs;

  var select_department = 0.obs;

  @override
  void onInit() async {
  await getDepartments();
  
  }

  getDepartments() async {
    Response response = await WebServices().getDepartments();
    final departmentModel = departmentModelFromJson(response.bodyString);
    departments.value = Future.value(departmentModel.data.departments);
    getDepartmentCategoryandBrand(departmentModel.data.departments.first.id);
  }

  getDepartmentCategoryandBrand(int departmentId) async {
    Response response =
        await WebServices().getDepartmentCategoryandBrand(departmentId);
    final departmentCategoryBrandModel =
        departmentCategoryBrandModelFromJson(response.bodyString);
    brands.value = Future.value(departmentCategoryBrandModel.data.brands);
    categories.value =
        Future.value(departmentCategoryBrandModel.data.categories);
  }
}
