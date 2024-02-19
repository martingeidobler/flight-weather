import 'package:weather/weather.dart';
import 'package:weatherapp/src/util/string_and_unit_helper.dart';

class SingleWeatherViewModel {
  Weather? weatherLocation;
  bool isGps;
  bool? isSaved;
  Exception? exception;
  int? elevationAga;

  SingleWeatherViewModel(this.weatherLocation, this.isGps, this.isSaved,
      this.exception, this.elevationAga);

  // todo: errorhandling
  get locationName => weatherLocation?.areaName ?? "";

  // get all in C, convert on presentation layer
  get temperatureNow => weatherLocation?.temperature;

  get temperatureHigh => weatherLocation?.tempMax;

  get temperatureLow => weatherLocation?.tempMin;

  get temperatureOffset =>
      StringAndUnitHelper.getTemperatureHeightOffsetInC(
          temperatureNow, elevationAga ?? 0);

  get temperatureAtHeight => temperatureNow - temperatureOffset;

  get skyDescription => weatherLocation?.cloudiness;

  get windSpeedNow => weatherLocation?.windSpeed;


}