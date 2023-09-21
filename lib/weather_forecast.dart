
import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const ForecastCard({super.key,
  required this.time,
  required this.icon,
  required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child:  Column(
          children: [
            Text(
              time,
              style:const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Icon(icon, size: 25),
           const SizedBox(height: 10),
            Text(
              temp,
              style:const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}