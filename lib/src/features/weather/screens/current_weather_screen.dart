import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weatherapp/src/features/weather/bloc/current_weather_cubit.dart';
import 'package:weatherapp/src/features/weather/widgets/weather_location_page.dart';

class CurrentWeatherScreen extends StatefulWidget {
  final CurrentWeatherBloc bloc;
  const CurrentWeatherScreen({super.key, required this.bloc});

  @override
  State<StatefulWidget> createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> with TickerProviderStateMixin{
  late PageController _weatherPageController;
  late TabController _bottomTabController;
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _weatherPageController = PageController();
    _bottomTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              AppLocalizations.of(context)!.appCurrentWeatherHeader,
              textAlign: TextAlign.center,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              throw UnimplementedError();
            },
          ),
          actions: [getActionButton()],
          shape: const Border(bottom: BorderSide(color: Colors.black)),
        ),
        body: StreamBuilder<List<LocationViewModel>>(
          stream: null,
          builder: (context, snapshot) {
            return PageView(
            
            );
          }
        ));
  }

  // ToDo: Check if it is the current location
  //       Add save/unsave functionality
  //       Make a theme-check for the now always-white
  Widget getActionButton() {
    if (false) {
      if (true) {
        return IconButton(
            onPressed: () {}, icon: const Icon(Icons.favorite_border));
      } else {
        return IconButton(onPressed: () {}, icon: const Icon(Icons.favorite));
      }
    } else {
      return Container(
        width: 46,
      );
    }
  }
}
