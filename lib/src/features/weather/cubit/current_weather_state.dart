import 'package:weatherapp/src/features/weather/repositories/models/single_weather_view_model.dart';

import '../viewmodels/weather_page_view_model.dart';

enum CurrentWeatherStatus { initial, loading, success, failure }

extension CurrentWeatherStatusX on CurrentWeatherStatus {
  bool get isInitial => this == CurrentWeatherStatus.initial;
  bool get isLoading => this == CurrentWeatherStatus.loading;
  bool get isSuccess => this == CurrentWeatherStatus.success;
  bool get isFailure => this == CurrentWeatherStatus.failure;
}

class CurrentWeatherState {
  final CurrentWeatherStatus currentStatus;
  final List<SingleWeatherViewModel> weatherList;
  final Units units;

  CurrentWeatherState({
    this.currentStatus = CurrentWeatherStatus.initial,
    this.units = Units.metric,
    List<SingleWeatherViewModel>? weatherList,
}) : weatherList = weatherList ?? [];

  CurrentWeatherState copyWith({
    CurrentWeatherStatus? currentStatus,
    Units? units,
    List<SingleWeatherViewModel>? weatherList,
  }) {
    return CurrentWeatherState(
      currentStatus: currentStatus ?? this.currentStatus,
      units: units ?? this.units,
      weatherList: weatherList ?? this.weatherList,
    );
  }
}
