import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:innostack/helpers/shared_prefs.dart';

import '../widgets/pickers/app_drawer.dart';

class MyLocationScreen extends StatefulWidget {
  const MyLocationScreen({Key? key}) : super(key: key);

  @override
  State<MyLocationScreen> createState() => _MyLocationScreenState();
}

class _MyLocationScreenState extends State<MyLocationScreen> {
  late LatLng currentlatlng;
  late String currentAddress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentlatlng = getCurrentLatLngFromSharedPrefs();
    currentAddress = getCurrentAddressFromSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Location'),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentlatlng, zoom: 15),
            markers: {
              Marker(
                markerId: const MarkerId('current_location'),
                position: currentlatlng,
                infoWindow: InfoWindow(
                  title: 'Current Location',
                  snippet: currentAddress,
                ),
              ),
            },
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Hi there!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato',
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'You are currently here:',
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 13,
                            color: Color.fromARGB(255, 116, 118, 128),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          currentAddress,
                          style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 3, 156, 216),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
