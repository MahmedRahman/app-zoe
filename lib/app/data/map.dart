
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'helper/AppConstant.dart';

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
                mapType: MapType.normal,
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
