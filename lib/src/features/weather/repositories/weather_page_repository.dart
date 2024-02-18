import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/src/features/shared/providers/location_provider.dart';
import 'package:weatherapp/src/features/shared/providers/weather_provider.dart';
import 'package:weatherapp/src/features/shared/model/custom_location_model.dart';
import 'package:weatherapp/src/features/weather/viewmodels/weather_view_model.dart';

class WeatherRepository {
  final WeatherProvider weatherProvider;
  final LocationProvider locationProvider;

  WeatherRepository(this.weatherProvider, this.locationProvider);

  // the flow here is as follows:
  // try get GPS, if GPS is there, that is the startpage.
  // if there is no GPS, land on the 1st location page
  // if there is NO saved location, show error message on error gps page with "oops! no saved or location!"
  Future<List<WeatherViewModel>> getWeatherData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    List<WeatherViewModel> viewModels = [];

    /// WEATHER AT LOCATION
    /// todo add error handling
    int? heightAGA;
    Position? location;
    Exception? locationException;
    try {
      location = await locationProvider.getCurrentLocation();
      heightAGA = await locationProvider.getAltitudeAboveGroundLevel(
          location.latitude, location.longitude);
    } catch (e) {
      locationException = e as Exception;
    }
    Weather? weatherAtLocation;
    if (locationException == null && location != null) {
      weatherAtLocation = await weatherProvider.getWeatherFromCords(
          location.latitude, location.longitude);
    }

    if (weatherAtLocation != null) {
      viewModels.add(
          WeatherViewModel(weatherAtLocation, true, null, null, heightAGA));
    }

    /// SAVED CITIES
    /// todo add error handling
    List<CustomLocationModel> locationList = [];
    List<String>? locationStringList =
        sharedPreferences.getStringList("savedLocations");
    if (locationStringList == null) {
      sharedPreferences.setStringList("savedLocations", []);
    } else {
      for (String locationString in locationStringList);
    }
    if (locationList.isNotEmpty) {
      for (CustomLocationModel location in locationList) {
        Weather? weatherAtSavedPosition;
        if (location.lat != null && location.long != null) {
          weatherAtSavedPosition = await weatherProvider.getWeatherFromCords(
              location.lat!, location.long!);
        } else if (location.name != null) {
          weatherAtSavedPosition =
              await weatherProvider.getWeatherFromCityName(location.name!);
        } else {
          throw Error();
        }
        viewModels.add(
            WeatherViewModel(weatherAtSavedPosition, false, true, null, 0));
      }
    }

    return viewModels;
  }
}
