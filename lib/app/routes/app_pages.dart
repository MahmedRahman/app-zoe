import 'package:get/get.dart';

import 'package:zoe/app/modules/account/adress/add/bindings/account_adress_add_binding.dart';
import 'package:zoe/app/modules/account/adress/add/views/account_adress_add_view.dart';
import 'package:zoe/app/modules/account/adress/list/bindings/account_adress_list_binding.dart';
import 'package:zoe/app/modules/account/adress/list/views/account_adress_list_view.dart';
import 'package:zoe/app/modules/account/bindings/account_binding.dart';
import 'package:zoe/app/modules/account/order/detail/bindings/account_order_detail_binding.dart';
import 'package:zoe/app/modules/account/order/detail/views/account_order_detail_view.dart';
import 'package:zoe/app/modules/account/order/list/bindings/account_order_list_binding.dart';
import 'package:zoe/app/modules/account/order/list/views/account_order_list_view.dart';
import 'package:zoe/app/modules/account/views/account_about_view.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
import 'package:zoe/app/modules/account/views/account_wish_list_view.dart';
import 'package:zoe/app/modules/authiocation/bindings/authiocation_binding.dart';
import 'package:zoe/app/modules/authiocation/views/authiocation_view.dart';
import 'package:zoe/app/modules/authiocation/views/forgotpassword_view.dart';
import 'package:zoe/app/modules/authiocation/views/otp_view.dart';
import 'package:zoe/app/modules/authiocation/views/signin_view.dart';
import 'package:zoe/app/modules/authiocation/views/signup_view.dart';
import 'package:zoe/app/modules/authiocation/views/splash_view.dart';
import 'package:zoe/app/modules/brand/bindings/brand_binding.dart';
import 'package:zoe/app/modules/brand/views/brand_view.dart';
import 'package:zoe/app/modules/cart/bindings/cart_binding.dart';
import 'package:zoe/app/modules/cart/views/cart_check_out_view.dart';
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/bindings/category_binding.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/entry_point/bindings/entry_point_binding.dart';
import 'package:zoe/app/modules/entry_point/views/entry_point_view.dart';
import 'package:zoe/app/modules/home/bindings/home_binding.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/home/views/layout_view.dart';
import 'package:zoe/app/modules/product/bindings/product_binding.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/modules/product/list/bindings/product_list_binding.dart';
import 'package:zoe/app/modules/product/list/views/product_list_view.dart';
import 'package:zoe/app/modules/product/views/product_detail_view.dart';
import 'package:zoe/app/modules/product/views/product_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ENTRY_POINT;

  static final routes = [
    GetPage(
      name: Routes.LayoutView,
      page: () => LayoutView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTHIOCATION,
      page: () => AuthiocationView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.OtpView,
      page: () => OtpView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SplashView,
      page: () => SplashView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SigninView,
      page: () => SigninView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.SignupView,
      page: () => SignupView(),
      binding: AuthiocationBinding(),
    ),
    GetPage(
      name: Routes.ForgotpasswordView,
      page: () => ForgotpasswordView(),
      binding: AuthiocationBinding(),
    ),

    GetPage(
      name: Routes.BRAND,
      page: () => BrandView(),
      binding: BrandBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.ProductDetailView,
      page: () => ProductDetailView(),
      binding: ProductBinding(),
    ),

    GetPage(
      name: Routes.CartCheckOutView,
      page: () => CartCheckOutView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.ENTRY_POINT,
      page: () => EntryPointView(),
      binding: EntryPointBinding(),
    ),

    GetPage(
      name: Routes.ServererroView,
      page: () => EntryPointView(),
      binding: EntryPointBinding(),
    ),
    GetPage(
      name: Routes.AccountAboutView,
      page: () => AccountAboutView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.AccountWishListView,
      page: () => AccountWishListView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_ORDER_LIST,
      page: () => AccountOrderListView(),
      binding: AccountOrderListBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_ORDER_DETAIL,
      page: () => AccountOrderDetailView(),
      binding: AccountOrderDetailBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_ADRESS_LIST,
      page: () => AccountAdressListView(),
      binding: AccountAdressListBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT_ADRESS_ADD,
      page: () => AccountAdressAddView(),
      binding: AccountAdressAddBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_LIST,
      page: () => ProductListView(),
      binding: ProductListBinding(),
    ),
  ];
}
