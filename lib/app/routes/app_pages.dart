import 'package:get/get.dart';

import 'package:zoe/app/modules/account/bindings/account_binding.dart';
import 'package:zoe/app/modules/account/views/account_view.dart';
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
import 'package:zoe/app/modules/cart/views/cart_view.dart';
import 'package:zoe/app/modules/category/bindings/category_binding.dart';
import 'package:zoe/app/modules/category/views/category_view.dart';
import 'package:zoe/app/modules/entry_point/bindings/entry_point_binding.dart';
import 'package:zoe/app/modules/entry_point/views/entry_point_view.dart';
import 'package:zoe/app/modules/home/bindings/home_binding.dart';
import 'package:zoe/app/modules/home/views/home_view.dart';
import 'package:zoe/app/modules/home/views/layout_view.dart';
import 'package:zoe/app/modules/order/bindings/order_binding.dart';
import 'package:zoe/app/modules/order/views/order_payment_view.dart';
import 'package:zoe/app/modules/order/views/order_view.dart';
import 'package:zoe/app/modules/product/bindings/product_binding.dart';
import 'package:zoe/app/modules/product/controllers/product_controller.dart';
import 'package:zoe/app/modules/product/views/product_brand_view.dart';
import 'package:zoe/app/modules/product/views/product_category_view.dart';
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
      name: Routes.ProductCategoryView,
      page: () => ProductCategoryView(),
      binding: ProductBinding(),
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
      name: Routes.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.OrderPaymentView,
      page: () => OrderPaymentView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.ENTRY_POINT,
      page: () => EntryPointView(),
      binding: EntryPointBinding(),
    ),
    GetPage(
      name: Routes.ProductBrandView,
      page: () => ProductBrandView(),
      binding: ProductBinding(),
    ),
  ];
}
