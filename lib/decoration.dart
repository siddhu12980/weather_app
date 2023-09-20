// ignore: unused_import
import 'dart:ui';
import 'package:flutter/material.dart';

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
      body:  Padding(
        padding: const EdgeInsets.all(16.0),

        child:  Column(
           
          children: [
            //MAIN CARD
            
            SizedBox(
              width: double.infinity,
              child: Card(
               shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),),
               ),
                elevation: 15,

                
                child: ClipRRect(
                  borderRadius:const BorderRadius.all(Radius.circular(10)),

                  child: BackdropFilter(
                    filter:ImageFilter.blur(sigmaX: 2,sigmaY: 5),
                
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "400F",
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            
                            
                            
                          ),
                            
                        
                            
                          Icon(Icons.cloud,
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
                      ),
                    ),
                  ),
                ),
              ),
            ),
          
            //weather card
            const Placeholder(
              fallbackHeight: 150,
            ),
          
            
            //additional feature
            const Placeholder(
              fallbackHeight: 150,
            ),
          ],
          //main_card
        ),
      ),
    );
  }
}
