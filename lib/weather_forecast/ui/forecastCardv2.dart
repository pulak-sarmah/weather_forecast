import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'bottom_view.dart';

Widget forecastCardv2(Lista lista) {
//  var forecastList = snapshot.data.list;
  //print(forecastList[0].dateTime);
  var dayofweek = DateFormat("EEEE").format(lista.dateTime);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayofweek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: lista.weather[0].main,
                color: Colors.pinkAccent,
                size: 45),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${lista.main.feelsLike.toStringAsFixed(0)} °C"),
                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown,
                      color: Colors.white, size: 17),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${lista.main.tempMax.toStringAsFixed(0)} °C"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp,
                        color: Colors.white, size: 17),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Hum: ${lista.main.humidity.toStringAsFixed(0)}"),
                    // Icon(FontAwesomeIcons.solidGrinBeamSweat,
                    //   color: Colors.white, size: 17),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Wind ${lista.wind.speed.toStringAsFixed(1)} mi/h"),
                    // Icon(FontAwesomeIcons.wind, color: Colors.white, size: 17),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.00),
                child: Row(
                  children: <Widget>[
                    Text("${lista.dtTxt}"),
                    Icon(FontAwesomeIcons.timesCircle,
                        color: Colors.white, size: 23),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
