import 'package:get/get.dart';
import 'package:zoe/app/data/model/category_products_model.dart';
import 'package:zoe/app/data/model/products_brand_model.dart';
import 'package:zoe/app/data/model/products_detaile_model.dart';
import 'package:zoe/app/modules/product/providers/product_provider.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController


  Future getProductByCategory(String categoryId) async {
    Response response =
        await ProductProvider().getProductByCategory(categoryId);

    final categoryProductsModel =
        categoryProductsModelFromJson(response.bodyString);

    return categoryProductsModel.data.products;
  }

  Future getProductDetailes(String productId) async {
    Response response = await ProductProvider().getProductDetailes(productId);
    final productsDetaileModel =
        productsDetaileModelFromJson(response.bodyString);

    return productsDetaileModel;
  }

  Future getProductByBrand(String brandId) async {
    Response response = await ProductProvider().getProductByBrand(brandId);
    final productsBrandModel = productsBrandModelFromJson(response.bodyString);
    return productsBrandModel.data.products;
  }
}
