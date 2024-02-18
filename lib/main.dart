import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weatherapp/src/features/weather/bloc/current_weather_cubit.dart';
import 'package:weatherapp/src/features/weather/screens/current_weather_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const FlightWeatherApp());
}

class FlightWeatherApp extends StatefulWidget {
  const FlightWeatherApp({super.key});

  @override
  State<StatefulWidget> createState() => _FlightWeatherAppState();
}

class _FlightWeatherAppState extends State<FlightWeatherApp> {
  final themeMode = ThemeMode.system;
  //todo: add to settings a "true/false/use systems"
  //todo: add settings
  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
        ],
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        home: CurrentWeatherScreen(bloc: CurrentWeatherBloc(null)) //CurrentWeatherScreen(),
        );
  }
}
