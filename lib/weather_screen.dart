import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/secret_key.dart';
import 'package:weather_app/weather_forecast_card.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getWeatherData() async {
    try {
      final out = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=Thrissur,IN&APPID=$weatherApi'),
      );
      final data = jsonDecode(out.body);
      if (data['cod'] != "200") {
        throw 'An error with accessing data';
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  weather = getWeatherData();
                });
              },
              icon: const Icon(
                Icons.refresh,
                size: 30,
              ),
              tooltip: 'Refresh',
            ),
            IconButton(
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light(useMaterial3: true))
                    : Get.changeTheme(ThemeData.dark(useMaterial3: true));
              },
              icon: const Icon(Icons.lightbulb_circle)
            ),
          ],
        ),
        body: FutureBuilder(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                snapshot.error.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 178, 65, 65),
                ),
              ));
            }

            final data = snapshot.data!;
            final double currentTemp = data['list'][0]['main']['temp'] - 270.0;
            final String currentSky = data['list'][0]['weather'][0]['main'];
            final int currentHumid = data['list'][0]['main']['humidity'];
            final int currentPressure = data['list'][0]['main']['pressure'];
            final double currentWind = data['list'][0]['wind']['speed'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '${currentTemp.toStringAsFixed(2)} °C',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Icon(
                                  currentSky == 'Rain'
                                      ? Icons.water_drop
                                      : currentSky == 'Clouds'
                                          ? Icons.cloud
                                          : Icons.sunny,
                                  size: 62,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  currentSky,
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Weather Forecast',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final hourForecast = data['list'][index + 1];
                        final String hourSky =
                            data['list'][index + 1]['weather'][0]['main'];
                        final double hourTemp =
                            hourForecast['main']['temp'] - 270.0;
                        final time = DateTime.parse(hourForecast['dt_txt']);

                        return WeatherForecastItem(
                          currentTime: DateFormat.j().format(time),
                          value: '${hourTemp.toStringAsFixed(2)} ',
                          icon: hourSky == 'Rain'
                              ? Icons.water_drop
                              : hourSky == 'Clouds'
                                  ? Icons.cloud
                                  : Icons.sunny,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Weather Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.water,
                            size: 46,
                          ),
                          const Text(
                            'Humidity',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('$currentHumid'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.air,
                            size: 46,
                          ),
                          const Text(
                            'Wind Speed',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('$currentWind'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.arrow_circle_down_sharp,
                            size: 46,
                          ),
                          const Text(
                            'Pressure',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('$currentPressure'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
