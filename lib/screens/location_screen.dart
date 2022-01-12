import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationData}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final locationData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  String? weatherImage;
  double? kiloVisibility;
  String? cityName;
  int? clouds;
  int? humidity;
  String? description;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];
      var conditon = weatherData['weather'][0]['id'];
      var materVisibility = weatherData['visibility'];
      kiloVisibility = materVisibility / 1000;
      humidity = weatherData['main']['humidity'];
      clouds = weatherData['clouds']['all'];
      description = weatherData['weather'][0]['description'];
      weatherImage = weatherModel.getImage(conditon!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(weatherImage.toString()),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$cityName',
                              style: const TextStyle(
                                fontSize: 22.0,
                                letterSpacing: 3.0,
                              ),
                            ),
                            Text(
                              '$temperature°',
                              style: const TextStyle(
                                fontSize: 90.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              '$description',
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 130,
                child: Card(
                  color: Colors.black.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$humidity%',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'humidity'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      const RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 70,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$kiloVisibility KM',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'visibility'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const RotatedBox(
                        quarterTurns: 1,
                        child: SizedBox(
                          width: 70,
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$clouds%',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'clouds'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
