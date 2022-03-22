import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../main.dart';

LatLng getCurrentLatLngFromSharedPrefs() {
  return LatLng(sharedPreferences.getDouble('latitude')!,
      sharedPreferences.getDouble('longitude')!);
}

String getCurrentAddressFromSharedPrefs() {
  return sharedPreferences.getString('current-address')!;
}

List<String> getArtistTitleFromSharedPrefs() {
  return sharedPreferences.getStringList('artist_title')!;
}

List<String> getTitleFromSharedPrefs() {
  return sharedPreferences.getStringList('title')!;
}

List<String> getOriginFromSharedPrefs() {
  return sharedPreferences.getStringList('origin')!;
}
