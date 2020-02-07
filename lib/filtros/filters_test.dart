import 'package:flutter/material.dart';
import 'package:appgo/filtros/filters_model.dart';
import 'package:appgo/filtros/salesman_item.dart';
import 'package:appgo/filtros/list_item.dart';
import 'package:appgo/filtros/list_model.dart';

class FiltersTest extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _FiltersTest();
  }
}

class _FiltersTest extends State<FiltersTest> {
  @override
  Widget build(BuildContext context) {
    FiltersModel salesman = new FiltersModel();

    var dateinit = new DateTime.now();
    var dateend = new DateTime.utc(2019, DateTime.december, 20);

    Duration difference = dateinit.difference(dateend);
    //assert(difference.inDays == 16592);

    print("cantidad de dias: ${difference.inDays}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters Test",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Text("Result: ${difference.inDays} "),
        // child: ListView.builder(
        //   itemCount: salesman.dateByItems.length,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       onTap: () {},
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           Text(salesman.dateByItems[index].name),
        //           Text(salesman.dateByItems[index].selected.toString())
        //         ],
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}
