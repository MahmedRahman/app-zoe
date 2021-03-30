import 'package:get/get.dart';
import 'package:zoe/app/data/model/brand_model.dart';
import 'package:zoe/app/data/repostory.dart';

class BrandProvider extends RepostoryProvide {
  getbrand() async {
    Response response = await repGet('brands');
    final brandsModel = brandsModelFromJson(response.bodyString);
    return brandsModel.data.brands;
  }
}
