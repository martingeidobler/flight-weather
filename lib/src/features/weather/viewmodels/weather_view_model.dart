import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/src/util/string_and_unit_helper.dart';

class WeatherViewModel {
  Weather? weatherLocation;
  bool isGps;
  bool? isSaved;
  Exception? exception;
  int? elevationAga;

  WeatherViewModel(this.weatherLocation, this.isGps, this.isSaved, this.exception, this.elevationAga);

  // todo: errorhandling
  get locationName => weatherLocation?.areaName ?? "";

  get temperatureNow => StringAndUnitHelper.getStringFromTemperature(weatherLocation?.tempMax);
  get temperatureHigh => StringAndUnitHelper.getStringFromTemperature(weatherLocation?.tempMax);
  get temperatureLow => StringAndUnitHelper.getStringFromTemperature(weatherLocation?.tempMax);
  get temperatureOffset => StringAndUnitHelper.getTemperatureHeightOffset(temperatureNow, elevationAga ?? 0);
  get temperatureAtHeight => StringAndUnitHelper.getStringFromTemperature(temperatureNow - temperatureOffset);

  get skyDescription => StringAndUnitHelper.getCloudinessStringFromDouble(weatherLocation?.cloudiness);
  get windSpeedNow => StringAndUnitHelper.getStringFromWindspeed(weatherLocation?.windSpeed);


}

