import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/features/shared/providers/location_provider.dart';
import 'package:weatherapp/src/features/weather/cubit/current_weather_state.dart';
import 'package:weatherapp/src/features/weather/repositories/models/single_weather_view_model.dart';
import 'package:weatherapp/src/features/weather/repositories/weather_page_repository.dart';
import 'package:weatherapp/src/features/weather/viewmodels/weather_page_view_model.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit(this._weatherPageRepository) : super(CurrentWeatherState());

  final WeatherPageRepository _weatherPageRepository;

    Future<void> getWeather() async {
      emit(state.copyWith(currentStatus: CurrentWeatherStatus.loading));
      try {


      //await _weatherPageRepository.getWeatherData();


      } catch (e) {
        //todo better error handling
      }
  }
}