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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.ACCOUNT_ADRESS_ADD);
                    },
                    child: Text(
                      'أضف عنون جديد',
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
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
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
                        Get.to(MapScreen());
                      }
                    },
                    child: Text('الموقع على الخريطة'),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
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
                children: List.generate(AddressList.length, (index) {
                  Datum Address = AddressList.elementAt(index);
                  if (index == 0) {
                    addressid.value = Address.id;
                    controller.addressid = Address.id;
                    controller.shappingPrice.value = Address.shippingFees;
                  }

                  return Obx(() {
                    return RadioListTile(
                      title: Text(Address.address.toString()),
                      subtitle: Text(Address.city.toString()),
                      value: Address.id,
                      groupValue: addressid.value,
                      onChanged: (int value) {
                        addressid.value = value;
                        controller.addressid = value;
                        controller.shappingPrice.value = Address.shippingFees;
                        print(controller.shappingPrice.value);
                      },
                    );
                  });
                }).toList(),
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

class MapScreen extends StatelessWidget {
  GoogleMapController _controller;
  var allMarker = List<Marker>().obs;

  Future<void> _showSearchDialog() async {
    /*

  await PlacesAutocomplete.show(
                context: context, apiKey: 'AIzaSyC8ph0Arqdy0u0I5kEqV44sXFPUSM7iOb0');
      

    var p = await PlacesAutocomplete.show(
        context: context,
        apiKey: 'AIzaSyC8ph0Arqdy0u0I5kEqV44sXFPUSM7iOb0',
        mode: Mode.fullscreen,
        language: "ar",
        region: "ar",
        offset: 0,
        hint: "Type here...",
        radius: 1000,
        types: [],
        strictbounds: false,
    );
    */
    //components: [Component(Component.country, "ar")]);
    // _getLocationFromPlaceId(p!.placeId!);
  }
  MapScreen() {
    setLocation();
  }

  @override
  Widget build(BuildContext context) {
    allMarker.add(
      Marker(
        markerId: MarkerId('MarkerId'),
        draggable: true,
        position: LatLng(Klatitude, Klongitude),
      ),
    );
    return new Scaffold(
      appBar: AppBar(
        title: Text('تحديد العنوان'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                final coordinates = new Coordinates(Klatitude, Klongitude);
                var addresses = await Geocoder.local
                    .findAddressesFromCoordinates(coordinates);
                var first = addresses.first;
                Kaddress.value = '${first.featureName} ${first.addressLine}';
                Get.back();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _showSearchDialog();
              },
            ),
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(Klatitude, Klongitude),
                  zoom: 14.4746,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                onTap: (LatLng _latLng) {
                  Marker marker = Marker(
                    markerId: MarkerId('MarkerId'),
                    draggable: true,
                    position: _latLng,
                  );
                  Klatitude = _latLng.latitude;
                  Klongitude = _latLng.longitude;
                  allMarker.add(marker);
                },
                markers: Set.from(allMarker),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_pin,
          color: Colors.white,
        ),
        onPressed: () {
          setLocation();
        },
      ),
    );
  }

  void setLocation() {
    Geolocator.getCurrentPosition().then(
      (_latLng) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                  _latLng.latitude,
                  _latLng.longitude,
                ),
                zoom: 14.0,
                bearing: 45.0,
                tilt: 45.0),
          ),
        );

        Marker marker = Marker(
          markerId: MarkerId('MarkerId'),
          draggable: true,
          position: LatLng(
            _latLng.latitude,
            _latLng.longitude,
          ),
        );
        Klatitude = _latLng.latitude;
        Klongitude = _latLng.longitude;
        allMarker.add(marker);
      },
    );
  }
}
