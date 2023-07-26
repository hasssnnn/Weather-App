// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

//va r     f8091132dc9a4b84853182906232906 

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try{
    String baseUrl = 'http://api.weatherapi.com/v1';
         // String apiKey = '562f602951234fd590e72504231307';

   String apiKey = 'f8091132dc9a4b84853182906232906';
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);

     weather = WeatherModel.fromJson(data);
     }catch(e){
      print(e);
     }
    return weather;
  }
        
}
