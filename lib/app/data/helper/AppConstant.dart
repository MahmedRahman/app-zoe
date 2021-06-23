import 'package:get/get.dart';

const appName = 'Zoe';
//const siteUrl = "https://active4web.com/yusr";
//const apikey = '1234567890';

double Klatitude = 0;
double Klongitude = 0;

var Kaddress = ''.obs;

var additionalFees;

int tax;

List<dynamic> provinances = [
  {
    "id": 5,
    "title": "الدمام",
    "cities": [
      {"id": 1, "title": "الدمام"},
      {"id": 2, "title": "القطيف"}
    ]
  },
  {
    "id": 6,
    "title": "القطيف",
    "cities": [
      {"id": 1, "title": "الدمام"},
      {"id": 2, "title": "القطيف"}
    ]
  }
];

var delivery_days;
var shipping_fees;
