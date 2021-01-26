import 'package:intl/intl.dart';

class Util {
  static String appId =
      "328131250b8df186337e52e082137b7d"; //unique app id from openweathermap.org

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, ''yy").format(dateTime);
  }
}
