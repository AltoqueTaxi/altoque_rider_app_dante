import 'package:driver_app/services/geolocation_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ApplicatiionProvider with ChangeNotifier {
  final geolocatorService = GeolocatorService();

  // Variables
  Position? currentLocation;

  ApplicatiionProvider() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }
}
