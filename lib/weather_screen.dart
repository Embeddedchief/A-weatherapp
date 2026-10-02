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
                  SizedBox(width: 100, child: WeatherForcastCards()),
                  SizedBox(width: 100, child: WeatherForcastCards()),
                  SizedBox(width: 100, child: WeatherForcastCards()),
                ],
              ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(fontWeight: FontWeight(500), fontSize: 20),
              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: additionalInformationCard(
                      'Humidity',
                      '65%',
                      Icons.water_outlined,
                      Color.fromARGB(255, 161, 205, 253),
                    ),
                  ),

                  SizedBox(width: 2),

                  SizedBox(
                    width: 100,
                    child: additionalInformationCard(
                      'Hotness',
                      '28°C',
                      Icons.thermostat,
                      Color.fromARGB(255, 252, 199, 161),
                    ),
                  ),

                  SizedBox(width: 2),

                  SizedBox(
                    width: 100,
                    child: additionalInformationCard(
                      'Wind',
                      '12 km/h',
                      Icons.air,
                      Color.fromARGB(255, 161, 252, 205),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//template for weather forecast widgets
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

//template for additional information widget

Widget additionalInformationCard(
  String condition,
  String temperature,
  IconData icon,
  Color cardColor,
) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Icon(icon),

        Text(condition),

        SizedBox(height: 5),

        Text(temperature, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
