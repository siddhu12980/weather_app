
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Additional_info_column extends StatelessWidget {
  const Additional_info_column({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const
    
     Column(
      children: [
        SizedBox(height: 10),
        Icon(Icons.water_drop_rounded, size: 25),
        SizedBox(height: 10),

        Text(
          "Humidity",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "94",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

