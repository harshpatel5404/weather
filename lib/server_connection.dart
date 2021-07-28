import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:weather/weather_response.dart';

 
Future <Dio> getDio()async{
   String url =
      "https://api.openweathermap.org/data/2.5/";
  var options = BaseOptions(baseUrl: url, 
    
    validateStatus: (status) {
      return status! < 500;
    },
   followRedirects: false,
  responseType: ResponseType.json );
  
  Dio dio = Dio(options);
  return dio;
}



Future<WeatherResponse> getWeather(String city)async{
Dio dio = await getDio();

Response response = await dio.get('weather?q=$city&appid=cea649bb9d02e431e505cc83b567e000');
if (response.data['cod'] == "404") {
 var weatherResponse = WeatherResponse.fromMap(response.data);
  return weatherResponse; 
}
try {
  final weatherResponse = WeatherResponse.fromMap(response.data);
  return weatherResponse; 
} catch (e) {
  print("errr is $e");
   var weatherResponse = WeatherResponse();
  return weatherResponse; 
}



}