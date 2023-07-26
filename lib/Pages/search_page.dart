// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/weather_services.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/provider_weather.dart';

class SearchPage extends StatelessWidget {
   SearchPage({Key? key,this.updateUi}) : super(key: key);
    String? cityName;

  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search for a city',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Lottie.asset('Assets/Images/animation_lkdz2r4c.json', animate: true),
              Padding(

                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (data)  {
                    cityName = data;
                  },
                  onSubmitted: (data) async {
                    cityName = data;
                    WeatherService service = WeatherService();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    Provider.of<WeatherProvider>(context,listen:false).weatherData= weather;
                    Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                    Navigator.pop(context);
                  },
                  decoration:  InputDecoration(

                      contentPadding:
                         const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                      suffixIcon: GestureDetector(
                        onTap: ()async {
                          WeatherService service = WeatherService();
                          WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                          Provider.of<WeatherProvider>(context,listen:false).weatherData= weather;
                          Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                          Navigator.pop(context);

                          print ('succeeded');
                        },

                      child: const Icon(Icons.search),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      label: const Text('Search'),
                      hintText: 'Enter a city'

                      ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
