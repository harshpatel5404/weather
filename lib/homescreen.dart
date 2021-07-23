import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRain = false;
  var datetime = DateTime.now();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  image: DecorationImage(
                      image: isRain
                          ? AssetImage("assets/bg_rain.jpg")
                          : AssetImage("assets/bg.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: size.height * 0.90,
              child: Image(
                image: isRain
                    ? AssetImage(
                        "assets/rain.png",
                      )
                    : AssetImage(
                        "assets/sunimg.png",
                      ),
                fit: BoxFit.contain,
                // fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          isRain
                              ? Text(
                                  "Rain",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Cloudy",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          isRain
                              ? Image.asset(
                                  "assets/rain_cloud.png",
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                )
                              : Image.asset(
                                  "assets/sun.png",
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                )
                        ],
                      ),
                      Text(
                        "22 °C",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${datetime.day} ',
                                style: TextStyle(
                                    color: Colors.purple[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45),
                              ),
                              TextSpan(
                                text: months[datetime.month - 1],
                                style: TextStyle(
                                    color: Colors.purple[900], fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          height: 5.0,
                          width: 150.0,
                          color: Colors.deepPurpleAccent[100],
                        ),
                      ),
                      Text(
                        "Surat",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
