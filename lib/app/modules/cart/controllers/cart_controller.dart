import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:zoe/app/api/web_serives.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/data/helper/AppUtils.dart';
import 'package:zoe/app/data/helper/showSnackBar.dart';
import 'package:zoe/app/modules/cart/model/CartItem.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

class CartController extends GetxController {
  List<CartItem> listCartItem = List<CartItem>.empty(growable: true).obs;

  var listCartItemFutter = Future.value().obs;

  RoundedLoadingButtonController buttonController;

  var shappingPrice = 30.obs;
  var totalPrice = 0.obs;
  int addressid = 1;

  void onInit() {
    updaetCartItem();
    buttonController = new RoundedLoadingButtonController();
    super.onInit();
  }

  updaetCartItem() {
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
    return listCartItem.length;
  }

  double cartTotalPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.productPrice;
    }

    price = price + shappingPrice.value;
    return price;
  }

  double cartTotalProductPrice() {
    double price = 0;
    for (CartItem localCartItem in listCartItem) {
      price = price + localCartItem.productPrice;
    }
    return price;
  }

  checkout() async {
    String productList = '';
    String productQty = '';
    String productSize = '';
    String productColor = '';
    var i = 0;

    listCartItem.forEach((CartItem _cartItem) {
      if (i == 0) {
        productList = productList.toString() + _cartItem.productid.toString();
        productQty = productQty.toString() + _cartItem.qty.toString();
        productSize = productSize.toString() + _cartItem.productSize.toString();
        productColor =
            productColor.toString() + _cartItem.productColor.toString();
        i = 1;
      } else {
        productList =
            productList.toString() + ',' + _cartItem.productid.toString();
        productQty = productQty.toString() + ',' + _cartItem.qty.toString();
        productSize =
            productSize.toString() + ',' + _cartItem.productSize.toString();
        productColor =
            productColor.toString() + ',' + _cartItem.productColor.toString();
      }
    });

    await WebServices()
        .checkout(
      addressid: addressid,
      colors: productColor,
      qtyList: productQty,
      productsList: productList,
      sizes: productSize,
    )
        .then((response) {
      if (response.body['success']) {
        showSnackBar(
            title: appName,
            message: response.body['message'],
            snackbarStatus: () {
              buttonController.stop();
              clearCart();
              Get.toNamed(Routes.LayoutView);
            });
      } else {
        showSnackBar(
            title: appName,
            message: response.body,
            snackbarStatus: () {
              buttonController.stop();
            });
      }
    });

    buttonController.stop();
  }

  void cartComplete() {
    //buttonController.reset();

    if (Get.find<UserAuth>().getUserToken() == null) {
      showSnackBar(
        title: appName,
        message: 'برجاء تسجيل الدخول لتمكن من اتمام الطلب',
        snackbarStatus: () {
          Get.toNamed(Routes.SigninView);
        },
      );
    } else {
      Get.toNamed(Routes.CartCheckOutView);
    }
  }
}
