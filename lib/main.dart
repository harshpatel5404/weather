import 'package:flutter/material.dart';
import 'package:weather/homescreen.dart';
import 'package:weather/search.dart';

import 'location.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        home: Location());
  }
}

