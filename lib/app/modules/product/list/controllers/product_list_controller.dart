import 'package:get/get.dart';
import 'package:zoe/app/api/model/category_products_model.dart';
import 'package:zoe/app/api/model/department_products_model.dart';
import 'package:zoe/app/api/model/products_brand_model.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  final productsList = Future.value().obs;

  List<dynamic> serectProductsList =[];


  Future getProductByCategory(String categoryId) async {
    ResponsModel responsModel =
        await WebServices().getProductByCategory(categoryId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final categoryProductsModel =
          categoryProductsModelFromJson(response.bodyString);
          serectProductsList =categoryProductsModel.data.products;
      productsList.value = Future.value(categoryProductsModel.data.products);
    }
  }

  Future getProductByBrand(String brandId) async {
    ResponsModel responsModel = await WebServices().getProductByBrand(brandId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final productsBrandModel =
          productsBrandModelFromJson(response.bodyString);
              serectProductsList =productsBrandModel.data.products;
      productsList.value = Future.value(productsBrandModel.data.products);
    }
  }

  Future getProductByDepartments(String departmentsId) async {
    ResponsModel responsModel =
        await WebServices().getProductByDepartments(departmentsId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final departmentProductsModel =
          departmentProductsModelFromJson(response.bodyString);
           serectProductsList =departmentProductsModel.data.products;
      productsList.value = Future.value(departmentProductsModel.data.products);
    }
  }



    getSerechProduct(String productName) async {
    if (GetUtils.isNullOrBlank(productName)) {
      productsList.value = Future.value(this.serectProductsList);
    } else {
      productsList.value = Future.value(
        serectProductsList
            .where(
              (element) {
              
                return element.name.contains(productName);
              } ,
            )
            .toList(),
      );
    }
  }

}
