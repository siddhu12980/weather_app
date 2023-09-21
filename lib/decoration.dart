// ignore: unused_import
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_next/additional_info_colum.dart';
import 'package:new_next/main_card.dart';
import 'package:new_next/weather_forecast.dart';

// ignore: camel_case_types
class My_Decoration extends StatelessWidget {
  const My_Decoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //MAIN CARD

            SizedBox(
              width: double.infinity,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                elevation: 15,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Mian_Card(),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weather Forecast",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            //weather card
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastCard(
                    time: "10:00",
                    icon: Icons.cloud,
                    temp: "200K",
                  ),
                  ForecastCard(
                    time: "10:00",
                    icon: Icons.sunny,
                    temp: "240K",
                  ),
                  ForecastCard(
                    time: "11:00",
                    icon: Icons.water,
                    temp: "315K",
                  ),
                  ForecastCard(
                    time: "12:00",
                    icon: Icons.air,
                    temp: "206K",
                  ),
                  ForecastCard(
                    time: "1:00",
                    icon: Icons.thunderstorm,
                    temp: "125K",
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            //additional feature
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Additional Info",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Additional_info_column(
                  icon: Icons.water_drop,
                  label: "Humidity",
                  value: "120",
                ),
                Additional_info_column(
                  icon: Icons.air,
                  label: "Wind Speed",
                  value: "7.6",
                ),
                Additional_info_column(
                  icon: Icons.beach_access,
                  label: "Pressure",
                  value: "1000",
                ),
              ],
            ),
          ],
          //main_card
        ),
      ),
    );
  }
}
