import 'package:get/get.dart';

import 'package:zoe/app/api/model/brand_model.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';

class BrandController extends GetxController {
  //TODO: Implement BrandController
  //

  final brandsList = Future.value().obs;
  List<Brand> brands = [];

  @override
  void onInit() async {
    await getBrand();
    super.onInit();
  }

  getBrand() async {
    ResponsModel responsModel = await WebServices().getbrand();
    if (responsModel.success) {
      Response response = responsModel.data;
      final brandsModel = brandsModelFromJson(response.bodyString);
      brandsList.value = Future.value(brandsModel.data.brands);
      brands = brandsModel.data.brands;
    } else {
      brandsList.value = Future.error(responsModel.code);
    }
  }

  getSerechBrand(String brandName) async {
    if (GetUtils.isNullOrBlank(brandName)) {
      brandsList.value = Future.value(this.brands);
    } else {

     List<Brand> temp = brands.where(
        (element) => element.name.contains(brandName),
      ).toList();




      brandsList.value = Future.value(temp);
    }
  }
}
