
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/model/card_data_model.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/weather_forecast/ui/forecastCardv2.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.list;

  var uniqueDates = CardDataModel.getUniqueDatesFromLista(forecastList);
  var cardData = CardDataModel.fromLista(forecastList);
  print(cardData);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: List.generate(uniqueDates.length, (indx) {
      return  Column(
        children: [
          Text(uniqueDates[indx]),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            height: 170,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: cardData[uniqueDates[indx]].length,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 160,
                    child: forecastCardv2(cardData[uniqueDates[indx]][index]),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff9661c3), Colors.white70],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                )),
          ),
        ],
      );
    })
  );
}
