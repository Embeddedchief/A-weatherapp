import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60),
            Text('Check Weather today'),
            SizedBox(width: 12),
            IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            
            child: Card(
              child: Column(
                children: [
                  Text('300 F',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight(700),
                  ),),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.cloud_circle,
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rain',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              )
            ),
          ),]),
      ),
    );
  }
}
