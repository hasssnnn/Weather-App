import 'package:flutter/material.dart';

class WeatherModel {
  double? temp;
  double? minTemp;
  double? maxTemp;
  String? weatherState;
  DateTime? date;
  String? image;

  WeatherModel(
      {required this.image,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        image: jsonData['condition']['icon'],
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherState: jsonData['condition']['text']);
  }

  String getImage () {
    if(weatherState == 'Thunderstorm'||weatherState == 'Thunder')
    {
      return 'Assets/Images/thunderstorm.png';
    }
    else if(weatherState == 'Clear' || weatherState == 'Light cloud'){
      return 'Assets/Images/clear.png';
    }
    else if(weatherState == 'Sleet' || weatherState == 'Snow' || weatherState == 'Hail'){
      return 'Assets/Images/snow.png';
    }
    else if(weatherState == 'Heavy cloud' || weatherState == 'Partly cloudy'){
      return 'Assets/Images/cloudy.png';
    }
    else if(weatherState == 'Light rain' || weatherState == 'Heavy rain' || weatherState == 'Showers' || weatherState == 'Patchy rain possible'){
      return 'Assets/Images/rainy.png';
    }
    else {
      return 'Assets/Images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return Colors.blue;
    } else if (weatherState == 'Clear' || weatherState == 'Light cloud') {
      return Colors.orange;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return Colors.blue;
    } else if (weatherState == 'Heavy cloud' ||
        weatherState == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weatherState == 'Light rain' ||
        weatherState == 'Heavy rain' ||
        weatherState == 'Showers' ||
        weatherState == 'Patchy rain possible') {
      return Colors.blue;
    } else {
      return Colors.orange;
    }
  }

  @override
  String toString() {
    return 'temp = $temp \nmintemp = $minTemp\nmaxtemp = $maxTemp\nweather state name = $weatherState\nDate = $date';
  }
}
