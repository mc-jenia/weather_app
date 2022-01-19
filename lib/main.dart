import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocationPermission permission;
  permission = await Geolocator.requestPermission();
  print(permission);
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
