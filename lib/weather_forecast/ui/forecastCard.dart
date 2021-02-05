import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/util/convert_icon.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';
import 'bottom_view.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  //print(forecastList[0].dateTime);
  var dayofweek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayofweek = fullDate.split(",")[0];

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
                weatherDescription: forecastList[index].weather[0].main,
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
                        "${forecastList[index].main.feelsLike.toStringAsFixed(0)} °C"),
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
                        "${forecastList[index].main.tempMax.toStringAsFixed(0)} °C"),
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
                        "Hum: ${forecastList[index].main.humidity.toStringAsFixed(0)}"),
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
                        "Wind ${forecastList[index].wind.speed.toStringAsFixed(1)} mi/h"),
                    // Icon(FontAwesomeIcons.wind, color: Colors.white, size: 17),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.00),
                child: Row(
                  children: <Widget>[
                    Text("${forecastList[index].dtTxt}"),
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
