import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather/weather.dart';

class WeatherProvider {
  WeatherFactory? wf;

  // Singleton Provider
  static final WeatherProvider _weatherProvider = WeatherProvider._internal();
  factory WeatherProvider() {
    return _weatherProvider;
  }

  WeatherProvider._internal();
// Singleton Provider


  Future<void> initWeatherFactory() async {
    if (wf != null){
      return;
    }
    wf = WeatherFactory(json.decode(await rootBundle.loadString('assets/keys.json'))["open_weather_map_key"]);
  }

  Future<Weather> getWeatherFromCords(double lat, double lon) async {
    await initWeatherFactory();
    return await wf!.currentWeatherByLocation(lat, lon);
  }

  Future<Weather> getWeatherFromCityName(String cityName) async {
    await initWeatherFactory();
    return await wf!.currentWeatherByCityName(cityName);
  }
}