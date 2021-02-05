import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';

class CardDataModel{


  static List<String> getUniqueDatesFromLista(List<Lista> listas)
  {
    List<String> uniqueDates = [];
    listas.forEach((element) {
      if (!uniqueDates.contains(element.date)) {
        uniqueDates.add(element.date);
      }
    });
    return uniqueDates;
  }
  static Map<String,List<Lista>> fromLista(List<Lista> listas){

    List<String> uniqueDates = getUniqueDatesFromLista(listas);

    final Map<String, List<Lista>> cardDataGroupedByDate = {};

    uniqueDates.forEach((date) {
      List<Lista> newList = [];
      listas.forEach((lista) {
        if(lista.date == date)
        {
          newList.add(lista);
        }
      });
      cardDataGroupedByDate[date] = newList;
    });

    return cardDataGroupedByDate;
  }
}