import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast_card.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
              onPressed: () {},
              icon: const Icon(
                Icons.refresh,
                size: 30,
              ),
              tooltip: 'Refresh',
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
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
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              '30 °C',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Icon(
                              Icons.cloud,
                              size: 62,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Cloudy'),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                    WeatherForecastItem(),
                  ],
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.water,
                        size: 46,
                      ),
                      Text(
                        'Humidity',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('100'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.air,
                        size: 46,
                      ),
                      Text(
                        'Wind Speed',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('100'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.arrow_circle_down_sharp,
                        size: 46,
                      ),
                      Text(
                        'Pressure',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('100'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

