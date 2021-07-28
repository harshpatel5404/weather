import 'package:flutter/material.dart';
import 'package:weather/location.dart';

import 'homescreen.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var city;
    TextEditingController? _controller;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (val) {
                city = val;
              },
              decoration: InputDecoration(
                hintText: "Search city",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black, width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black, width: 3.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  print(city);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen(city: city,)));
                },
                child: Text("Confirm")),
          )
        ],
      )),
    );
  }
}
