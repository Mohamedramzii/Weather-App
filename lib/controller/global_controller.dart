import 'dart:async';

import 'package:climate_guide/models/weather_data_model/weather_data_model.dart';
import 'package:climate_guide/services/fetch_data.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  //variables
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _long = 0.0.obs;
  final RxString _city = ''.obs;
  final weatherdatamodel = WeatherDataModel().obs;
  final RxInt currentIndex=0.obs;

  late StreamSubscription<Position> streamSubscription;

  // int currentIndex=0;

  List<String> weatherDataImages=[
    'assets/icons/windspeed.png',
    'assets/icons/clouds.png',
    'assets/icons/humidity.png',
  ];

  //Date
  var date=DateFormat.yMMMMd().format(DateTime.now());

  // RxList weatherDataList=[].obs;

  // instances
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lat;
  RxDouble getLongitude() => _long;
  RxString getCity() => _city;

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getCurrentLocation();
    }
  }

  @override
  void onClose() {
    streamSubscription.cancel();
  }

  getCurrentLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if service is not enabled
    if (!isServiceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service is not enabled!!');
    }

    //status of permissition
    locationPermission = await Geolocator.checkPermission();
    //check if location permission is denied forever
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied forever!!');
    } else if (locationPermission == LocationPermission.denied) {
      //request location permission again
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Location permission is denied again!!');
      }
    }

    //getting current position
    // return await Geolocator.getCurrentPosition(
    //         desiredAccuracy: LocationAccuracy.best)
    //     .then((value) {
    //   _lat.value = value.latitude;
    //   _long.value = value.longitude;
    //   _isLoading.value = false;
    // });

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      _lat.value = position.latitude;
      _long.value = position.longitude;
      getAddressFromLatLong(position);
      Fetch_Data()
          .fetchData(position.latitude, position.longitude)
          .then((value) => weatherdatamodel.value = value);
      _isLoading.value = false;
    });
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    _city.value = place.administrativeArea!;
  }
}
