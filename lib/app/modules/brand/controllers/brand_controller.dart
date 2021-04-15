import 'package:get/get.dart';

import 'package:zoe/app/api/model/brand_model.dart';
import 'package:zoe/app/api/web_serives.dart';

class BrandController extends GetxController {
  //TODO: Implement BrandController
  Future<List<Brand>> brands;

  @override
  void onInit() {
    getBrand();
  }

  

  getBrand() async {
    Response response = await WebServices().getbrand();
    final brandsModel = brandsModelFromJson(response.bodyString);
    brands =Future.value(brandsModel.data.brands);
    return brandsModel.data.brands;
  }
}
