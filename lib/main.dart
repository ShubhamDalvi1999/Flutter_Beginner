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
  String year;
  Sales({
    required this.sales,
    required this.year,
  });
}

class _MyAppState extends State<MyApp> {
  //SALES DATA FOR X AND Y AXIS IN THE FORM OF A CUSTOM CLASS SALES
  List<Sales> _data = [];

  //LIST OF CHART SERIES
  List<charts.Series<Sales, String>> _chartdata = [];

  @override
  void initState() {
    super.initState();
    final rnd = new Random();
    for (var i = 2010; i < 2012; i++) {
      _data.add(Sales(year: i.toString(), sales: rnd.nextInt(1000)));
    }
    _chartdata.add(charts.Series(
      id: "Sales",
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      data: _data,
      domainFn: (Sales sales, _) => sales.year, //X axis
      measureFn: (Sales sales, _) => sales.sales, //Y axis
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      displayName: 'sales',
    ));
  }

  void _makeData() {
    final rnd = new Random();
    for (var i = 2010; i < 2022; i++) {
      _data.add(
        Sales(year: i.toString(), sales: rnd.nextInt(1000)),
      ); // SALES DATA ADDED TO THE LIST OF SALES
    }
    _chartdata.add(
      charts.Series(
        id: "Sales",
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        displayName: 'sales',
      ),
    );
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
                child: charts.BarChart(_chartdata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
