import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  late LatLng _userLocation;
  bool _isLocationObtained = false;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Por favor, permite el acceso a tu ubicación"),
        backgroundColor: Colors.red,
      ));
      return;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
      _isLocationObtained = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ubicación del Usuario"),
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLocationObtained
          ? Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _userLocation,
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('user_location'),
                      position: _userLocation,
                      infoWindow: InfoWindow(title: 'Tu ubicación'),
                    ),
                  },
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      _mapController.animateCamera(
                        CameraUpdate.newLatLng(_userLocation),
                      );
                    },
                    backgroundColor: Colors.blueAccent,
                    child: Icon(
                      FontAwesomeIcons.locationArrow,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
