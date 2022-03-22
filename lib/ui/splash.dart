import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:innostack/main.dart';
import 'package:innostack/request/chicago_api.dart';
import 'package:innostack/request/geolocator.dart';

import '../request/geocoder.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

Future<Position> getUserCurrentLocation() async {
  Position position = await determinePosition();
  sharedPreferences.setDouble('latitude', position.latitude);
  sharedPreferences.setDouble('longitude', position.longitude);

  return position;
}

Future<String> getUserCurrentAddress() async {
  Position position = await getUserCurrentLocation();
  String address = await getAddressFromLatLong(position);
  sharedPreferences.setString('current-address', address);

  return address;
}

Future getDataFromApi() async {
  dynamic response = await getData();
}

class _SplashState extends State<Splash> {
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    getUserCurrentLocation();
    getUserCurrentAddress();
    getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Splash'));
  }
}
