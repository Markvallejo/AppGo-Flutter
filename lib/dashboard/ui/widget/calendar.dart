import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<DateTime> selectedDate = showDatePicker(
      context: context,
      locale: Locale('es'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget calendar) {
        return Theme(
          data: ThemeData.light(),
          child: calendar,
        );
      },
    ).then((dateSelected) {
      var today = DateTime.now();
      Duration numberDays = today.difference(dateSelected);

      if (numberDays.inDays.isNegative) {
        print("La Fecha seleccionada no es valida");
        return null;
      } else
        print("Dias: ${numberDays.inDays}");
      return dateSelected;
    });
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              return selectedDate;
            },
          ),
        ],
      ),
    );
  }
}
