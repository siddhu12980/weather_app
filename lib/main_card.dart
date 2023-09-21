
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Mian_Card extends StatelessWidget {
  const Mian_Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "400F",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.cloud,
          size: 60,
        ),
        Text(
          "Rain",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}


//start at 14.25