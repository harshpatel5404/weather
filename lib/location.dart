import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/homescreen.dart';
import 'package:weather/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Location());
  }
}

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var latitude;
  var longtitude;
  String? city;

  Future _determinePosition() async {
    LocationPermission permission;

    try {
      permission = await Geolocator.requestPermission();
      print("1. $permission ");
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }

      return Geolocator.getCurrentPosition();
    } catch (e) {
      print(e);
    }
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longtitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
        print(_currentAddress);
        city = place.locality;
      });
    } catch (e) {
      print(e);
    }
  }

  callme() async {
    await Future.delayed(Duration(seconds: 5));
    _determinePosition().then((position) {
      setState(() {
        latitude = position.latitude;
        longtitude = position.longitude;
      });
      _getAddressFromLatLng();
    });
  }

  var _currentAddress;

  @override
  void initState() {
    super.initState();
    callme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: _currentAddress == null && longtitude == null && latitude == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      Text(
                        'latitude = $latitude && longtitude = $longtitude',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Location is $_currentAddress")
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(city: city),
                        ),
                      );
                    },
                    child: Text("Weather"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchCity(),
                        ),
                      );
                    },
                    child: Text("Search city"),
                  ),
                ],
              ),
      ),
    );
  }
}
