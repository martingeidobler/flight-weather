import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/src/features/weather/repositories/models/single_weather_view_model.dart';
import 'package:weatherapp/src/features/weather/repositories/weather_page_repository.dart'
    as weather_repo;
import 'package:weatherapp/src/features/weather/viewmodels/weather_page_view_model.dart';
import 'package:weatherapp/src/util/string_and_unit_helper.dart';

class WeatherPageViewModel {
  final List<SingleWeatherViewModel> viewModelList;
  final DateTime lastUpdated;

  const WeatherPageViewModel({
    required this.lastUpdated,
    required this.viewModelList,
  });

  factory WeatherPageViewModel.fromRepository(
      weather_repo.SingleWeather weatherPageViewModel) {
    return WeatherPageViewModel(
        viewModelList: weatherPageViewModel.viewModelList);
  }
}

enum Units { imperial, metric }

extension TemperatureUnitsX on Units {
  bool get isImperial => this == Units.imperial;

  bool get isMetric => this == Units.metric;
}
