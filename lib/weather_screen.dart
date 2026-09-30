import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Check your Weather today'),
            GestureDetector(
              onTap: () {
                print('refreshed');
              },
              child: Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
