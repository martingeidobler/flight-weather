import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/src/features/shared/providers/location_provider.dart';

class CurrentWeatherBloc extends Bloc<WeatherUpdateEvent, WeatherPageState> {
  CurrentWeatherBloc(this.repository) {

  }


    var List<Location>;
    getSavedLocationsForHomePage(){
        LocationProvider().getLocationsForHomePage();
    }
}