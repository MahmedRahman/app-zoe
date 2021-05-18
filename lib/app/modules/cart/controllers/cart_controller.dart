import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppEnumeration.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';
import 'package:zoe/app/modules/cart/views/cart_address_view.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class CartController extends GetxService {
  List<CartItem> listCartItem = List<CartItem>.empty(growable: true).obs;
  var listCartItemFutter = Future.value().obs;
  RoundedLoadingButtonController buttonController;
  var shappingPrice = 30.obs;
  var totalPrice = 0.obs;
  int addressid = 1;
  var shopCount = 0.obs;
  TextEditingController PromoCode = new TextEditingController();
  var discount = 0.obs;

  void onInit() {
    updaetCartItem();
    buttonController = new RoundedLoadingButtonController();
    super.onInit();
  }

  updaetCartItem() {
    cartCount();
    listCartItemFutter.value = Future.value(listCartItem);
  }

  addToCart(CartItem cartItem) {
    if (isExitProduct(cartItem) == false) {
      listCartItem.add(cartItem);
    }
    updaetCartItem();
  }

  bool isExitProduct(CartItem cartItem) {
    for (CartItem localCartItem in listCartItem) {
      if (localCartItem.productid == cartItem.productid &&
          localCartItem.productSize == cartItem.productSize &&
          localCartItem.productColor == cartItem.productColor) {
        localCartItem.addQty(qty: cartItem.qty);

        return true;
      }
    }
    return false;
  }

  clearCart() {
    listCartItem.clear();
    shopCount.value = 0;
  }

  carClearItem(int index) {
    listCartItem.removeAt(index);

    showSnackBar(
        title: appName,
        message: 'تم حذف العنصر',
        snackbarStatus: () {
          updaetCartItem();
        });
  }

  int cartCount() {
    int Qty = 0;
    for (CartItem localCartItem in listCartItem) {
      Qty = Qty + localCartItem.qty;
    }
    shopCount.value = Qty;
    return Qty;
  }

  double cartTotalPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.totalprice;
    }

    price = (price + shappingPrice.value) - discount.value;
    return price;
  }

  double cartTotalProductPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.totalprice;
    }
    return price;
  }

  checkout() async {
    String productList = listCartItem
        .fold(
            '',
            (previousValue, element) => previousValue =
                previousValue + element.productid.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    String productQty = listCartItem
        .fold(
            '',
            (previousValue, element) =>
                previousValue = previousValue + element.qty.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    String productSize = listCartItem
        .fold(
            '',
            (previousValue, element) => previousValue =
                previousValue + element.productSize.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    String productColor = listCartItem
        .fold(
            '',
            (previousValue, element) => previousValue =
                previousValue + element.productColor.toString() + ',')
        .toString()
        .replaceAll(RegExp(r'.$'), "");

    ResponsModel responsModel = await WebServices().checkout(
      addressid: addressid,
      colors: productColor,
      qtyList: productQty,
      productsList: productList,
      sizes: productSize,
      discount_code: PromoCode.text,
    );

    PromoCode.clear();
    discount.value = 0;

    if (responsModel.success) {
      Response response = responsModel.data;

      if (response.body['success']) {
        showSnackBar(
          title: appName,
          message: response.body['message'],
          snackbarStatus: () {
            buttonController.stop();
            clearCart();
            Get.toNamed(Routes.LayoutView);
          },
        );
      } else {
        showSnackBar(
            title: appName,
            message: response.body,
            snackbarStatus: () {
              buttonController.stop();
            });
      }
    } else {
      buttonController.stop();
    }
  }

  void cartComplete() {
    if (Get.find<UserAuth>().getUserToken() == null) {
      Kselectindex.value = 4;
    } else {
      Get.toNamed(Routes.CartCheckOutView);
    }
  }

  void cartAddress() {
    if (Get.find<UserAuth>().getUserToken() == null) {
      Kselectindex.value = 4;
    } else {
      Get.to(AddressView());
    }
  }

  void getPromoCodeChecker() async {
    ResponsModel responsModel =
        await WebServices().getPromoCodeChecker(PromoCode.text);
    if (responsModel.success) {
      Response response = responsModel.data;
      if (response.body['success']) {
        print(response.body['data']['discount']);
        discount.value = response.body['data']['discount'];
      } else {
        Get.snackbar(appName, 'خطا فى استخدام كود الخصم');
      }
    }
  }
}
