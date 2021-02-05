import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart' as http;

class Network{
  Future<WeatherForecastModel> getWeatherForecast({String cityName}) async{

   var cityname= cityName;

    Position position = await  Geolocator.getCurrentPosition();
   // print("https://geocode.xyz/${position.latitude},${position.longitude}?json=1&");
    final r = await http.get("https://geocode.xyz/${position.latitude},${position.longitude}?json=1&");
     Map<String,dynamic> data = jsonDecode(r.body);
     cityname = data["city"];


   var finalUrl ="https://api.openweathermap.org/data/2.5/forecast?q="+cityname+"&mode=json&appid="+Util.appId+"&units=metric";
    //final resposne1 = await http.get("http://geocode.xyz/${position.latitude},${position.longitude}?json=1");
   // print("${position.latitude}   :  ${position.longitude}");


    final response = await http.get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object )
    //  print("weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather forecast");
    }




  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}

