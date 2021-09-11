import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoe/app/api/api_manger.dart';
import 'package:zoe/app/api/response_model.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';

class WebServices extends APIManger {
  Future<ResponsModel> getProfile() async {
    ResponsModel response = await repGet('profile');
    return response;
  }

  Future<ResponsModel> getWishList() async {
    ResponsModel response = await repGet('wishlist');
    return response;
  }

  Future<ResponsModel> getOrderHistory() async {
    ResponsModel response = await repGet('orders');
    return response;
  }

  Future<ResponsModel> getOrderDetailsHistory(String orderid) async {
    ResponsModel response = await repGet('orders/' + orderid);
    return response;
  }

  Future<ResponsModel> getAccountAdress() async {
    ResponsModel response = await repGet('user_address');
    return response;
  }

  Future<ResponsModel> addAccountAdress(String address, int city,
      {String landMark = ''}) async {
    ResponsModel response = await repPost(
        'user_address',
        {
          'address': address,
          'city': city,
          'lat': Klatitude,
          'lang': Klongitude,
          'land_mark': landMark
        },
        showLoading: true);

    return response;
  }

  Future<ResponsModel> getDepartments() async {
    ResponsModel response = await repGet('departments');
    return response;
  }

  Future<ResponsModel> getDepartmentCategoryandBrand(int departmentId) async {
    ResponsModel response =
        await repGet('department/' + departmentId.toString());
    return response;
  }

  Future<ResponsModel> getProvinances() async {
    ResponsModel response = await repGet('provinances');
    return response;
  }

  Future<ResponsModel> getOrderExtraInfo() async {
    ResponsModel response = await repGet('order_extra_info');
    return response;
  }

  Future<ResponsModel> sendEmailForgetPassword(String email) async {
    ResponsModel response = await repPost(
        'forgot_password',
        {
          "email": email,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> setResetPassword(String code) async {
    ResponsModel response = await repPost(
        'reset_password',
        {
          "code": code,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> updateProfile(String name, String email) async {
    ResponsModel response = await repPost(
        'update_profile',
        {
          "name": name,
          "email": email,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> changePassword(
      String password, String passwordConfirmation) async {
    ResponsModel response = await repPost(
        'change_password',
        {
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
        showLoading: true);
    return response;
  }

  Future<ResponsModel> getPayMethods() async {
    ResponsModel response = await repGet('pay_methods');
    return response;
  }

  Future<ResponsModel> getSearchProduct({@required search}) async {
    ResponsModel response = await repGet(
      'search?search=${search.toString()}',
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> createUser({
    @required String name,
    @required String email,
    @required String mobile,
    @required String password,
  }) async {
    ResponsModel response = await repPost(
        'register',
        {
          "name": name,
          "email": email,
          "mobile": mobile,
          "password": password,
        },
        showLoading: true);

    return response;
  }

  Future<ResponsModel> signin({
    @required String mobile,
    @required String password,
  }) async {
    ResponsModel response = await repPost(
        'login',
        {
          "mobile": mobile,
          "password": password,
        },
        showLoading: true);

    return response;
  }

  Future<ResponsModel> getbrand() async {
    ResponsModel response = await repGet('brands');
    return response;
  }

  Future<ResponsModel> getcities() async {
    ResponsModel response = await repGet('cities');
    return response;
  }

  Future<ResponsModel> checkerqty(
      {@required String product,
      @required String color,
      @required String size,
      @required String qty}) async {
    ResponsModel response = await repPost(
      'add_to_cart_qty',
      {
        'product': product,
        'color': color,
        'size': size,
        'qty': qty,
      },
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> freeshipping() async {
    ResponsModel response = await repGet('brands');
    return response;
  }

  Future<ResponsModel> checkout(
      {@required String productsList,
      @required String qtyList,
      @required int addressid,
      @required String colors,
      @required String sizes,
      @required int payMethod,
      String discount_code}) async {
    ResponsModel response = await repPost(
        'checkout',
        {
          'products': productsList,
          'qty': qtyList,
          'pay_method': payMethod,
          'address': addressid,
          'colors': colors,
          'sizes': sizes,
          GetUtils.isNullOrBlank(discount_code) ? '' : 'discount_code':
              discount_code,
        },
        showLoading: true);
    print('xxxxxxxxx');

    print(response.data.bodyString);

    print('xxxxxxxxxxx');

    return response;
  }

  Future<ResponsModel> getProductByCategory(String categoryId) async {
    ResponsModel response = await repGet('category/$categoryId');
    return response;
  }

  Future<ResponsModel> getProductOffers() async {
    ResponsModel response = await repGet('offers');
    return response;
  }

  Future<ResponsModel> getProductByDepartments(String departmentsId) async {
    ResponsModel response = await repGet('department_products/$departmentsId');
    return response;
  }

  Future<ResponsModel> deleteUserAddress(int userAddresId) async {
    ResponsModel response =
        await repPost('delete_user_address/' + userAddresId.toString(), '');
    return response;
  }

  Future<ResponsModel> getProductByBrand(String brandId) async {
    ResponsModel response = await repGet('brands/$brandId');
    return response;
  }

  Future<ResponsModel> getProductDetailes(String productId) async {
    ResponsModel response = await repGet('product/$productId');
    return response;
  }

  Future<ResponsModel> setFavoraitProduct(String productId) async {
    ResponsModel response =
        await repPost('wishlist_product', {'product': productId});
    return response;
  }

  Future<ResponsModel> getHomePage() async {
    ResponsModel response = await repGet('home');
    return response;
  }

  Future<ResponsModel> setSmsCode(String mobile) async {
    ResponsModel response =
        await repPost('sms_code', {'mobile': mobile}, showLoading: true);
    return response;
  }

  Future<ResponsModel> vertificationCode(String mobile, bool status) async {
    ResponsModel response = await repPost(
      'vertification_code',
      {'mobile': mobile, 'status': status},
      showLoading: true,
    );
    return response;
  }

  Future<ResponsModel> getVersion() async {
    ResponsModel response = await repPost(
      'https://dev.matrixclouds.com/zoe/public/api/api_version',
      {'version': '1.0.0'},
    );
    return response;
  }

  Future<ResponsModel> getPromoCodeChecker(String discount_code) async {
    ResponsModel response = await repPost(
        'promo_code',
        {
          'discount_code': discount_code,
        },
        showLoading: true);
    return response;
  }
}
