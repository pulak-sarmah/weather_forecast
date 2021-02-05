import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/weather_forecast.dart';

//void main() => runApp(ScaffoldExample());

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
      brightness: Brightness.dark,
      accentColor: Colors.amber,
      primaryColor: Colors.grey[800],
      scaffoldBackgroundColor: Colors.red,
      backgroundColor: Colors.amber,
      textTheme: _appTextTheme(base.textTheme));
}

TextTheme _appTextTheme(TextTheme base) {
  return base
      .copyWith(
      headline5: base.headline5.copyWith(
        fontWeight: FontWeight.w500,
      ),
      headline6:
      base.headline6.copyWith(fontSize: 18.0, fontStyle: FontStyle.italic),
      caption: base.caption
          .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
      button: base.button.copyWith(
        //fontSize: 23.9,

      ),
      bodyText2: base.bodyText2.copyWith(
        fontSize: 16.9,
        fontFamily: "Lobster",
        color: Colors.white,
      ))
      .apply(
    fontFamily: "Lobster",
    displayColor: Colors.amber,
    //bodyColor: Colors.red
  );
}

void main() => runApp(new MaterialApp(
  /*
   Uncomment theme ( bellow ) to see the effects of _appTheme across the entire app
   */
  // theme: _appTheme,
//     theme: ThemeData(
//        brightness: Brightness.dark,
//        primaryColor: Colors.grey[800],
//
//       textTheme: TextTheme(
//          headline: TextStyle(
//              fontSize: 34,
//            fontWeight: FontWeight.bold,
//          ),
//         body1: TextStyle(
//            fontSize: 16.9,
//           color: Colors.white
//         )
//
//       )

  //),
  home: WeatherForecast(),


));
