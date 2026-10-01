import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 100),
            Text(
              'Check Weather today',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight(500)),
            ),

            SizedBox(width: 35),

            IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,

              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "600.45° F",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight(700),
                        ),
                      ),

                      SizedBox(height: 15),

                      Icon(Icons.cloud_circle, size: 60),

                      SizedBox(height: 5),

                      Text(
                        "Sunny",
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(fontWeight: FontWeight(500), fontSize: 20),
              ),
            ),

            SizedBox(height: 1),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 100, child: WeatherForcastCards()),
                  SizedBox(width: 100, child: WeatherForcastCards()),
                  WeatherForcastCards(),
                  WeatherForcastCards(),
                  WeatherForcastCards(),
                ],
              ),
            ),

            SizedBox(height: 10),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(fontWeight: FontWeight(500), fontSize: 20),
              ),
            ),

            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class WeatherForcastCards extends StatelessWidget {
  const WeatherForcastCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            '03:00',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 5),

          Icon(Icons.cloud, size: 30),

          SizedBox(height: 5),

          Text('Sunny'),
        ],
      ),
    );
  }
}
