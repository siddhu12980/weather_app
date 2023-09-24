// ignore: unused_import
import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:new_next/additional_info_colum.dart';

import 'package:new_next/secret.dart';
import 'package:new_next/weather_forecast.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class My_Decoration extends StatefulWidget {
  const My_Decoration({super.key});

  @override
  State<My_Decoration> createState() => _My_DecorationState();
}

// ignore: camel_case_types
class _My_DecorationState extends State<My_Decoration> {
  double temp = 0;
  // ignore: non_constant_identifier_names

  // ignore: empty_constructor_bodies
  Future<Map <String,dynamic>> getCurrentWeather() async {
    try {
      String cityName = "London";

      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,uk&APPID=$openweatherapikey'),
      );

      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw " unexpected error";
      }
      return data;
      //
    } catch (e) {
      throw e.toString();
    }
  }

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
   
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError){
            return Center(child: (Text(snapshot.error.toString())));
          }

          final data=snapshot.data!;
          final currentTemp=temp = data['list'][0]["main"]["temp"];


          return Padding(
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
                        child:  Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Text(
                                "$currentTemp K",
                                style: const TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(
                                Icons.cloud,
                                size: 60,
                              ),
                             const Text(
                                "Rain",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
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
          );
        },
      ),
    );
  }
}
