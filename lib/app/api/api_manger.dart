import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:zoe/auth.dart';

String baes_url = 'https://dev.matrixclouds.com/zoe/public/api/';
String api_key = 'zoe_api_key';
String Language = 'ar';

class APIManger extends GetConnect {
  final header = {
    'x-api-key': api_key,
    'Content-Language': Language,
    'Authorization': 'Bearer ',
  };

  void setUserTokan() {
    String tokan = Get.find<UserAuth>().getUserToken();

    if (tokan != null) {
      header.update(
        'Authorization',
        (value) {
          return 'Bearer ' + tokan;
        },
      );
    }
  }

  Future<Response> repPost(url, body) async {
    print("Api Request " + baes_url + url);
    setUserTokan();
    Response response = await post(baes_url + url, body, headers: header);
    print("Api Request " +
        baes_url +
        url +
        " Api Request:: " +
        response.statusCode.toString());
    try {
      switch (response.statusCode) {
        case 200:
          //return response;
          if (isJsonParsable(response.bodyString)) {
            print(response.body['errors']);
            return response;
          } else {
            print(response.bodyString);
            Future.error('error');
          }
          break;
        case 201:
          //return response;
          if (isJsonParsable(response.bodyString)) {
            return response;
          } else {
            print(response.bodyString);
            Future.error('error');
            //  Get.toNamed(Routes.SETTING);
          }
          break;
        default:
          print(response.statusCode);
          print(response.bodyString);
          Get.toNamed(Routes.ServererroView);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> repGet(url) async {
    print("Api Request " + baes_url + url);
    setUserTokan();
    Response response = await get(baes_url + url, headers: header);

    print("Api Request " +
        baes_url +
        url +
        " Api Request:: " +
        response.statusCode.toString());

    try {
      switch (response.statusCode) {
        case 200:
          if (isJsonParsable(response.bodyString)) {
            return response;
          } else {
            print(response.bodyString);
          }

          break;
        default:
          print(response.bodyString);
          Get.toNamed(Routes.ServererroView);
      }
    } catch (e) {
      print(e);
      throw e;
    }

    //print(response.hasError);
  }

  bool isJsonParsable(String jsonString) {
    try {
      var decodedJSON = json.decode(jsonString) as Map<String, dynamic>;
      return true;
    } on FormatException catch (e) {
      return false;
    }
  }
}
