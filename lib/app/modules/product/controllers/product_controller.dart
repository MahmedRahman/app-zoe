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

  var price_before_discount = 0.0.obs;

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

  final productsDetaileModelFuture = Future.value().obs;

  Future getProductDetailes(String productId) async {
    ResponsModel responsModel =
        await WebServices().getProductDetailes(productId);
    if (responsModel.success) {
      Response response = responsModel.data;
      productQty.value = 1;
      final productsDetaileModel =
          productsDetaileModelFromJson(response.bodyString);

      price_before_discount.value =
          productsDetaileModel.data.product.priceBeforeDiscount;

      if (productsDetaileModel.data.product.colors.length == 0) {
        productsDetaileModelFuture.value = Future.value(productsDetaileModel);
      } else {
        productsDetaileModel.data.product.colors.forEach(
          (element) {
            productsDetaileModel.data.productImages.add(element.image);
          },
        );

        productsDetaileModelFuture.value = Future.value(productsDetaileModel);
      }

      return productsDetaileModel;
    }
  }

  void productAddToCart(ProductsDetaileModel productsDetaile) {
/*
var productid = productsDetaile.data.product.id.toString();
var productColor = productsDetaile.data.product.colors.length == 0
          ? ''
          : productsDetaile.data.product.colors
              .elementAt(productColorSelect.value)
              .id;

var productSize =productsDetaile.data.product.sizes.length == 0
          ? ''
          : productsDetaile.data.product.colors
              .elementAt(productColorSelect.value)
              .id;

var productQty =productQty.value.toString();
*/

    WebServices()
        .checkerqty(
      product: productsDetaile.data.product.id.toString(),
      color: productsDetaile.data.product.colors.length == 0
          ? '0'
          : productsDetaile.data.product.colors
              .elementAt(productColorSelect.value)
              .id,
      size: productsDetaile.data.product.sizes.length == 0
          ? '0'
          : productsDetaile.data.product.colors
              .elementAt(productColorSelect.value)
              .id,
      qty: productQty.value.toString(),
    )
        .then((ResponsModel responsModel) {
      if (responsModel.success) {
        if (responsModel.data.body['success']) {
          Get.snackbar(
            appName,
            '???? ?????????????? ?????? ?????? ??????????????????',
            barBlur: .9,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.grey,
            colorText: Colors.black,
            messageText: Text(
              '???? ?????????????? ?????? ?????? ??????????????????',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );

          Get.find<CartController>().addToCart(
            new CartItem(
              productimage: productsDetaile.data.product.colors.length == 0
                  ? productsDetaile.data.productImages[0]
                  : productsDetaile.data.product.colors
                      .elementAt(productColorSelect.value)
                      .image,
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
        } else {
          Get.snackbar(appName, responsModel.data.body['message'].toString());
        }
      }
    });
  }

  Future SetFavoraitProduct(String brandId) async {
    ResponsModel responsModel = await WebServices().setFavoraitProduct(brandId);
    if (responsModel.success) {}
  }
}
