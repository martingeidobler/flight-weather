import 'package:flutter/material.dart';
import 'package:weather/src/features/weather/screens/current_weather_screen.dart';

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      home: const CurrentWeatherScreen(),
    );
  }
}
