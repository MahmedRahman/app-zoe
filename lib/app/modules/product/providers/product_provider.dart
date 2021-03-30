import 'package:get/get.dart';
import 'package:zoe/app/data/repostory.dart';

class ProductProvider extends RepostoryProvide {

  getProductByCategory(String categoryId) async {
    Response response = await repGet('category/$categoryId');
    return response;
  }

  getProductByBrand(String brandId) async {
    Response response = await repGet('brands/$brandId');
    return response;
  }

  getProductDetailes(String productId) async {
    Response response = await repGet('product/$productId');
    return response;
  }
  
}
