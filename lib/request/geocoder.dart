import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

String? address;

Future<String> getAddressFromLatLong(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarks[0];
  address =
      '${place.name}, ${place.street}, ${place.locality}, ${place.country}';

  return address.toString();
}
