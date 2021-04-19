import 'package:get/get.dart';
import 'package:zoe/app/api/model/department_category_brand_model.dart';
import 'package:zoe/app/api/model/department_model.dart';
import 'package:zoe/app/api/response_model.dart';
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
    ResponsModel responsModel = await WebServices().getDepartments();
    if (responsModel.success) {
      Response response = responsModel.data;
      final departmentModel = departmentModelFromJson(response.bodyString);
      departments.value = Future.value(departmentModel.data.departments);
      getDepartmentCategoryandBrand(departmentModel.data.departments.first.id);
    }
  }

  getDepartmentCategoryandBrand(int departmentId) async {
    ResponsModel responsModel =
        await WebServices().getDepartmentCategoryandBrand(departmentId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final departmentCategoryBrandModel =
          departmentCategoryBrandModelFromJson(response.bodyString);
      brands.value = Future.value(departmentCategoryBrandModel.data.brands);
      categories.value =
          Future.value(departmentCategoryBrandModel.data.categories);
    }
  }
}
