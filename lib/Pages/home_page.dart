// ignore_for_file: must_be_immutable
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:weather_app/Pages/search_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/provider_weather.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  void updateUi() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return  SearchPage(
                        updateUi: updateUi,
                        );
                  }),
                );
              },
              icon: const Icon(Icons.search)),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ?  Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  'There is no weather yet',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Try to search now!',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ]),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemeColor(),
                weatherData!.getThemeColor()[300]!,
                weatherData!.getThemeColor()[100]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              //  alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(Provider.of<WeatherProvider>(context).cityName!,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(

                      //'Updated at : ${weatherData!.date}',
                      'updated at : ${weatherData!.date!.hour.toString()}:${weatherData!.date!.minute.toString()}',

                       //${weatherData!.date!.hour.toString()}:${weatherData!.date.toString()}',
                      style: const TextStyle(
                        fontSize: 24,
                      )),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       Image.asset(weatherData!.getImage()),

                      Text(
                        weatherData!.temp!.toInt().toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                      Column(
                        children: [
                          // Text('${weatherData!.temp}',
                          //     style: const TextStyle(
                          //         fontSize: 30, fontWeight: FontWeight.bold)),
                          // Text('min : ${weatherData!.minTemp.toInt()}',
                          //     style: const TextStyle(
                          //       fontSize: 24,
                          //     )),
                          // Text('max : ${weatherData!.maxTemp.toInt()}',
                          //     style: const TextStyle(
                          //       fontSize: 24,
                          //     )),

                          Text('Max: ${weatherData!.maxTemp!.toInt()}'),
                          Text('Min: ${weatherData!.minTemp!.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData!.weatherState!,
                    style: const TextStyle(fontSize: 24),
                  ),
                  // Text(
                  //   weatherData?.weatherState ?? '',
                  //   style: const TextStyle(
                  //       fontSize: 32, fontWeight: FontWeight.bold),
                  // ),
                  const Spacer(flex: 3),
                ],
              ),
            ),
    );
  }
}
