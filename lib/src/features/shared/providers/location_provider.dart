import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/src/features/shared/providers/provider_exceptions.dart';

class LocationProvider {
  // Singleton Provider
  static final LocationProvider _locationProvider = LocationProvider._internal();

  factory LocationProvider() {
    return _locationProvider;
  }

  LocationProvider._internal();
  // Singleton Provider

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationTurnedOffException();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedForeverException();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<int> getAltitudeAboveGroundLevel(double lat, double long) async {
    var key = json.decode(await rootBundle.loadString(
        'assets/keys.json'))["open_weather_map_key"];
    http.Response response;
    try {
      response =
      await http.get(Uri.parse(
          "https://maps.googleapis.com/maps/api/elevation/json?locations=${lat
              .toString()}%2C${long.toString()}&key=$key"));
    } catch (e) {
      // todo: error handling
      return -1;
    }
    if (response.statusCode == 400){
      return jsonDecode(response.body)["results"][0]["elevation"];
    }
    return -1;
    // todo see above
  }
}