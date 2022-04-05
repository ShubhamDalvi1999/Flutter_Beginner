import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class Sales {
  int sales;
  int year;
  charts.Color color;
  Sales({
    required this.sales,
    required this.year,
    required this.color,
  });
}

class _MyAppState extends State<MyApp> {
  //SALES DATA FOR X AND Y AXIS IN THE FORM OF A CUSTOM CLASS SALES
  List<Sales> _data = [];

  //LIST OF CHART SERIES
  List<charts.Series<Sales, int>> _chartdata = [];

  @override
  void initState() {
    super.initState();
    _data = <Sales>[
      Sales(
          sales: 4,
          year: 20,
          color: charts.MaterialPalette.purple.shadeDefault),
      Sales(
          sales: 1,
          year: 15,
          color: charts.MaterialPalette.deepOrange.shadeDefault),
      Sales(
          sales: 2,
          year: 35,
          color: charts.MaterialPalette.yellow.shadeDefault),
      Sales(
          sales: 3, year: 30, color: charts.MaterialPalette.green.shadeDefault),
    ]; //actual chart data
    //now creating a series of chartdata
    _chartdata.add(charts.Series(
      id: "Sales",
      data: _data,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      colorFn: (Sales sales, _) => sales.color,
      labelAccessorFn: (Sales sales, _) => '${sales.year}: ${sales.sales}',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Text("Sales Data"),
              Expanded(
                child: charts.PieChart(
                  _chartdata,
                  animate: true,
                  defaultRenderer:
                      charts.ArcRendererConfig(arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside,
                        insideLabelStyleSpec: new charts.TextStyleSpec(
                            fontSize: 16, color: charts.Color.black))
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
