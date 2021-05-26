import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zoe/app/component/CustomAppBar.dart';
import 'package:zoe/app/component/CustomIndicator.dart';
import 'package:zoe/app/data/helper/AppConstant.dart';
import 'package:zoe/app/modules/account/adress/list/controllers/account_adress_list_controller.dart';
import 'package:zoe/app/modules/account/model/account_adrees_model.dart';
import 'package:zoe/app/modules/cart/controllers/cart_controller.dart';
import 'package:zoe/app/routes/app_pages.dart';
import 'package:geocoder/geocoder.dart';

class AddressView extends GetView<CartController> {
  var addressid = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustemAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.ACCOUNT_ADRESS_ADD);
                    },
                    child: Text(
                      ' عنون جديد',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              addressWidget(),
              SizedBox(
                height: 15,
              ),
              Obx(
                () {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      Kaddress.toString(),
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff4C1711), // background
                      onPrimary: Colors.white, // foreground
                    ),
                    onPressed: () {
                      if (addressid.value == 0) {
                        Get.snackbar(appName, 'برجاء اختيار عنوان التواصيل');
                      } else {
                        controller.cartComplete();
                      }
                    },
                    child: Text('متابعة'),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget addressWidget() {
    AccountAdressListController _accountController =
        Get.put(AccountAdressListController());
    _accountController.getAccountAdress();
    return GetX<AccountAdressListController>(builder: (_) {
      return FutureBuilder(
          future: _accountController.AdreesModel.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> AddressList = snapshot.data;
              AddressList.sort((b, a) => a.id.compareTo(b.id));
              return Column(
                children: List.generate(
                  AddressList.length,
                  (index) {
                    Datum Address = AddressList.elementAt(index);

               

                    return Obx(
                      () {
                        return RadioListTile(
                          title: Text(Address.address.toString()),
                          subtitle: Text(Address.city.toString()),
                          value: Address.id,
                          groupValue: addressid.value,
                          onChanged: (int value) {
                            addressid.value = value;
                            controller.addressid = value;
                            controller.shappingPrice.value =
                                Address.shippingFees;
                            Kaddress.value =
                                "${Address.address.toString()} ${Address.city.toString()} ${Address.district.toString()} ${Address.building.toString()} ${Address.houseNumber} ${Address.landMark} ";

    
                          },
                        );
                      },
                    );
                  },
                ).toList(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: CustomIndicator(
                  indicatorStatus: IndicatorStatus.error,
                ),
              );
            }
            return Center(child: CustomIndicator());
          });
    });
  }
}