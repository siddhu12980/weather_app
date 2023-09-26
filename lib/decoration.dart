// ignore: unused_import
import 'dart:convert';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_next/additional_info_colum.dart';
// import 'drop_down.dart';
// import 'package:new_next/drop_down.dart';

import 'package:new_next/secret.dart';
import 'package:new_next/weather_forecast.dart';
import 'package:http/http.dart' as http;

List<String> cityList = <String>[
  'Delhi',
  'Bengaluru',
  'Karnataka',
  'Patna',
  'Kathmandu',
  'Butwal',
];
const List<String> countryList = [
  'india',
  'nepal',
];

// ignore: camel_case_types
class My_Decoration extends StatefulWidget {
  const My_Decoration({super.key});

  @override
  State<My_Decoration> createState() => _My_DecorationState();
}

// ignore: camel_case_types
class _My_DecorationState extends State<My_Decoration> {
  late Future<Map<String, dynamic>> weather;
  // final String? cityName =const DropdownButtonExample().getSelectedCityName;
  String selectedCity = cityList.first;
  String selectedCountry = countryList.first;

  double temp = 0;

  // ignore: non_constant_identifier_names

  // ignore: empty_constructor_bodies
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = selectedCity;
      String countryname = selectedCountry;

      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName,$countryname&APPID=$openweatherapikey'),
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
  void initState() {
    super.initState();
    weather = getCurrentWeather();
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
            onPressed: () {
              setState(() {
                weather = getCurrentWeather(); //reinilizating weather
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future:
            weather, //now we are not calling function we are just calling var so we dont have to rebuild ui every refresh clicked
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return const Center(child: (Text("Server Error")));
          }

          final data = snapshot.data!;
          final currentTemp = data['list'][0]["main"]["temp"];
          final currentSky = data['list'][0]["weather"][0]["main"];
          final pressure = data['list'][0]["main"]["pressure"];
          final humidity = data['list'][0]["main"]["humidity"];
          final wind = data['list'][0]["wind"]["speed"];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //MAIN CARD

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      value: selectedCity,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCity = newValue!;
                        });
                      },
                      items: cityList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: selectedCountry,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue!;
                        });
                      },
                      items: countryList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text('Country: $value'),
                        );
                      }).toList(),
                    ),
                  ],
                ),

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
                        child: Padding(
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
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 65,
                              ),
                              Text(
                                "$currentSky",
                                style: const TextStyle(
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
                    "Hourly Forecast",
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
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0; i <= 10; i++)    USE FOR()...[  ] instead of for() {}
                //         ForecastCard(
                //           time: data['list'][i]['dt'].toString(),
                //           icon:data['list'][i]["weather"][0]["main"]=="Clouds" || data['list'][i]["weather"][0]["main"]=="Rain" ? Icons.cloud : Icons.sunny ,
                //           temp: data["list"][i]["main"]["temp"].toString(),
                //         ),
                //     ],
                //   ),
                // ),

//listvirw -colum_scrobable

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlyforecast = data['list'][index + 1];
                      final hourlysky =
                          data['list'][index + 1]["weather"][0]["main"];
                      final hourlytemp =
                          data['list'][index + 1]["main"]["temp"].toString();
                      final times = DateTime.parse(hourlyforecast["dt_txt"]);
                      return ForecastCard(
                        time: DateFormat.Hm().format(times),
                        icon: hourlysky == "Clouds" || hourlysky == "Rain"
                            ? Icons.cloud
                            : Icons.sunny,
                        temp: hourlytemp,
                      );
                    },
                  ),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Additional_info_column(
                      icon: Icons.water_drop,
                      label: "Humidity",
                      value: "$humidity",
                    ),
                    Additional_info_column(
                      icon: Icons.air,
                      label: "Wind Speed",
                      value: "$wind",
                    ),
                    Additional_info_column(
                      icon: Icons.beach_access,
                      label: "Pressure",
                      value: "$pressure",
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
