import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/model/department_products_model.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/api/model/category_products_model.dart';
import 'package:zoe/app/api/model/products_brand_model.dart';
import 'package:zoe/app/api/model/products_detaile_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  RoundedLoadingButtonController buttonController =
      new RoundedLoadingButtonController();

  var productSizeSelect = 0.obs;
  var productColorSelect = 0.obs;

  var productQty = 1.obs;

  var ProductPrice = 0.0.obs;

  addproductQty() {
    productQty.value = productQty.value + 1;
  }

  removeproductQty() {
    var qty;

    qty = productQty.value - 1;
    if (qty != 0) {
      productQty.value = qty;
    }
  }

  Future getProductByCategory(String categoryId) async {
    ResponsModel responsModel =
        await WebServices().getProductByCategory(categoryId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final categoryProductsModel =
          categoryProductsModelFromJson(response.bodyString);
      productQty.value = 1;
      return categoryProductsModel.data.products;
    }
  }

  Future getProductByDepartments(String departmentsId) async {
    ResponsModel responsModel =
        await WebServices().getProductByDepartments(departmentsId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final departmentProductsModel =
          departmentProductsModelFromJson(response.bodyString);

      return departmentProductsModel.data.products;
    }
  }

  final productsDetaileModelFuture = Future.value().obs;

  Future getProductDetailes(String productId) async {
    ResponsModel responsModel =
        await WebServices().getProductDetailes(productId);
    if (responsModel.success) {
      Response response = responsModel.data;

      final productsDetaileModel =
          productsDetaileModelFromJson(response.bodyString);

      if (productsDetaileModel.data.product.colors.length == 0) {
        productsDetaileModelFuture.value = Future.value(productsDetaileModel);
      } else {
        productsDetaileModel.data.product.colors.forEach((element) {
          productsDetaileModel.data.productImages.add(element.image);
        });

        productsDetaileModelFuture.value = Future.value(productsDetaileModel);
      }

      return productsDetaileModel;
    }
  }

  Future getProductByBrand(String brandId) async {
    ResponsModel responsModel = await WebServices().getProductByBrand(brandId);
    if (responsModel.success) {
      Response response = responsModel.data;
      final productsBrandModel =
          productsBrandModelFromJson(response.bodyString);
      return productsBrandModel;
    }
  }

  void productAddToCart(ProductsDetaileModel productsDetaile) {
    Get.snackbar(
      appName,
      'تم الاضافة الى سلة المشتريات',
      barBlur: .9,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey,
      colorText: Colors.black,
      messageText: Text(
        'تم الاضافة الى سلة المشتريات',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );

    // bntrest();

    //icon: LottieBuilder.asset('assets/productnotfound.json'));

    Get.find<CartController>().addToCart(
      new CartItem(
        productimage: productsDetaile.data.productImages[0],
        productid: productsDetaile.data.product.id,
        productName: productsDetaile.data.product.name,
        productPrice: productSizeSelect.value == 0
            ? productsDetaile.data.product.price
            : productsDetaile.data.product.sizes
                .elementAt(productSizeSelect.value)
                .price,
        productColor: productsDetaile.data.product.colors.length == 0
            ? 0
            : productsDetaile.data.product.colors
                .elementAt(productColorSelect.value)
                .id,
        productSize: productsDetaile.data.product.sizes.length == 0
            ? 0
            : productsDetaile.data.product.sizes
                .elementAt(productSizeSelect.value)
                .id,
        productColorName: productsDetaile.data.product.colors.length == 0
            ? ''
            : productsDetaile.data.product.colors
                .elementAt(productColorSelect.value)
                .title,
        productSizeName: productsDetaile.data.product.sizes.length == 0
            ? ''
            : productsDetaile.data.product.sizes
                .elementAt(productSizeSelect.value)
                .title,
        qty: productQty.value,
      ),
    );
  }

  bntrest() {
    buttonController.reset();
  }

  Future SetFavoraitProduct(String brandId) async {
    ResponsModel responsModel = await WebServices().setFavoraitProduct(brandId);
    if (responsModel.success) {}
  }
}
