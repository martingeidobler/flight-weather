import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/length.dart';
import 'package:units_converter/properties/temperature.dart';
import 'package:weather/weather.dart' as open_weather_map;
import 'package:weatherapp/src/features/weather/viewmodels/weather_page_view_model.dart';

abstract class StringAndUnitHelper{
  //todo add prober unit conversions and live update to those
  static String getStringFromTemperature(double? temp, Units unit){
    if (temp == null){
      return "";
    }
    if (unit == Units.metric) {
      return '$temp°';
    } else  {
      return '$temp°';
    }
  }

  static String getStringFromWindspeed(double? windSpeed, Units unit){
    if (windSpeed == null){
      return "";
    }
    if (unit == Units.metric){
      return "${windSpeed.convertFromTo(LENGTH.meters, LENGTH.kilometers)}kmh";
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
  static int getTemperatureHeightOffsetInC(int temp, int heightAga){
    if (heightAga < 175){
      return 0;
    }
    return (6.5 * (heightAga / 1000)).toInt();
  }
}