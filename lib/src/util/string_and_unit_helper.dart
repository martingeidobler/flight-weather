import 'package:shared_preferences/shared_preferences.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/models/unit.dart';
import 'package:units_converter/properties/length.dart';
import 'package:weather/weather.dart';

abstract class StringAndUnitHelper{
  //todo add prober unit conversions and live update to those
  static String getStringFromTemperature(Temperature? temp){
    if (temp== null){
      return "";
    }
    if (true) {
      return '${temp.celsius}°';
    } else {
      return '${temp.fahrenheit}°';
    }
  }

  static String getStringFromWindspeed(double? windSpeed){
    if (windSpeed == null){
      return "";
    }
    if (true){
      return "${windSpeed.convertFromTo(LENGTH.meters, LENGTH.kilometers)}kmh";
    } else if (false) {
      return "${windSpeed.convertFromTo(LENGTH.meters, LENGTH.miles)}mph";
    } else {
    return "${windSpeed.convertFromTo(LENGTH.meters, LENGTH.nauticalMiles)}kt";
    }
  }

  static String getCloudinessStringFromDouble(double? cloudiness){
    if (cloudiness == null){
      return "";
    }
    switch (cloudiness) {
      case 0:
        return "weather_condition_no_clouds";
      case <25:
        return "weather_condition_few_clouds";
      case <50:
        return "weather_condition_cloudy";
      case <75:
        return "weather_condition_pretty_cloudy";
      case <90:
        return "weather_condition_mostly_cloudy";
      default:
        return "weather_condition_overcast";
    }
  }

  // every 1000m gained temperature drops by about 6.5c
  // to make up for that, i get the height above ground level, devide it
  // by 100 to see just how much colder it si
  static int getTemperatureHeightOffset(int temp, int heightAga){
    if (heightAga < 175){
      return 0;
    }
    return  (6.5 * (heightAga / 1000)).toInt();
  }
}