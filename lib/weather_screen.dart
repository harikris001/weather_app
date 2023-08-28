import 'package:flutter/material.dart';

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
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Placeholder(
              fallbackHeight: 140,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Weather Forecast',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Placeholder(
              fallbackHeight: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Weather Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [],
            ),
          ],
        ));
  }
}
