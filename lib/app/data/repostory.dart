import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

String baes_url = 'https://dev.matrixclouds.com/zoe/api/';
String api_key = 'zoe_api_key';
String Language = 'ar';


class RepostoryProvide extends GetConnect {
  final header = {
    'x-api-key': api_key,
    'Content-Language': Language,
    'Authorization': 'Bearer ',
  };

  Future<Response> repPost(url, body) async {
    print("Api Request " + baes_url + url);

    Response response = await post(baes_url + url, body, headers: header);

    try {
      switch (response.statusCode) {
        case 200:
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
        //  Get.toNamed(Routes.SplashView);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> repGet(url) async {
    print("Api Request " + baes_url + url);

    // String tokan = Get.find<UserAuth>().getUserToken();

    // print(tokan);
/*
    if (tokan != null) {
      header.update(
        'Authorization',
        (value) {
          return 'Bearer ' + tokan;
        },
      );
    }
*/
    Response response = await get(baes_url + url, headers: header);

    try {
      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          if (isJsonParsable(response.bodyString)) {
            return response;
          } else {
            print(response.bodyString);
            // Get.toNamed(Routes.SETTING);
          }

          break;
        default:
          print(response.bodyString);
        // Get.toNamed(Routes.SETTING);
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
/*
  var isJsonParsable = string => {
    try {
        JSON.parse(string);
    } catch (e) {
        return false;
    }
    return true;
}
*/
}
