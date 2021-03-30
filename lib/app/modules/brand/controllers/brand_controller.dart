import 'package:get/get.dart';
import 'package:zoe/app/data/BrandModel.dart';
import 'package:zoe/app/modules/brand/providers/brand_provider.dart';

class BrandController extends GetxController {
  //TODO: Implement BrandController
  
  getBrand(){
    return BrandProvider().getbrand();
  }
}
