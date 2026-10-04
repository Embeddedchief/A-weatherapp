import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final String apiKey = '26a3431624be829597083beacd1318db';
  double temperature = 600.45;
  String condition = 'Sunny';
  double sunrise = 2344;
  double sunset = 2344;
  String measure = '°F';
  int pressure = 24;
  int humidity = 32;
  double cloud = 57090;

  //Weather geter async function
  Future getCurrentWeather(String location) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$location,uk&APPID=$apiKey',
    );
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          temperature = data['main']['temp'];
          sunrise = (data['sys']['sunrise'] as num).toDouble();
          sunset = (data['sys']['sunset'] as num).toDouble();
          pressure = (data['main']['pressure'] as num).toInt();
          humidity = (data['main']['humidity'] as num).toInt();
          // cloud = (data['clouds']['dt'] as num).toDouble();
        });

        print(jsonDecode(response.body));
      } else {
        print('Request Failed: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 100),
            Text(
              'Check Weather today',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight(500)),
            ),

            SizedBox(width: 35),

            IconButton(
              onPressed: () {
                getCurrentWeather('London');
              },
              icon: Icon(Icons.refresh),
            ),
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
                        '${temperature.toString()} $measure',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight(700),
                        ),
                      ),

                      SizedBox(height: 15),

                      Icon(Icons.cloud_circle, size: 60),

                      SizedBox(height: 5),

                      Text(
                        condition,
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

            //Weather Forecast
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
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: WeatherForcastCards(
                        rate: sunrise.toString(),
                        icon: Icons.sunny,
                        condition: 'Sunrise',
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: 150,
                      child: WeatherForcastCards(
                        rate: sunset.toString(),
                        icon: Icons.sunny_snowing,
                        condition: 'Sunset',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: WeatherForcastCards(
                      rate: pressure.toString(),
                      icon: Icons.wind_power,
                      condition: 'Pressure',
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: WeatherForcastCards(
                      rate: humidity.toString(),
                      icon: Icons.wb_sunny_rounded,
                      condition: 'Humidity',
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 150,
                    child: WeatherForcastCards(
                      rate: cloud.toString(),
                      icon: Icons.cloud,
                      condition: 'Cloudy',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            //Additional Information
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
  final String rate;
  final IconData icon;
  final String condition;

  const WeatherForcastCards({
    super.key,
    required this.rate,
    required this.icon,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            rate,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 5),

          Icon(icon),

          SizedBox(height: 5),

          Text(condition),
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
