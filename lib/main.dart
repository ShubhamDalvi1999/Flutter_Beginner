import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class Area {
  int index;
  String name;
  Color color;
  Area({
    this.index: -1,
    this.name: "Area",
    this.color: Colors.lightBlueAccent,
  });
}

class _MyAppState extends State<MyApp> {
  List<Area> _areas = [];
  int _location = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 16; i++) {
      _areas.add(Area(index: i, name: "Area $i"));
    }
    var rndm = new Random();
    _location = rndm.nextInt(_areas.length);
  }

  void _onPressed(int index) {
    print("location is $_location");
    print("index clicked is $index");
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.lightGreen;
      } else {
        _areas[index].color = Colors.red;
      }
    });
  }

  Widget _generate(int index) {
    return GridTile(
        child: Container(
      padding: EdgeInsets.all(5.0),
      child: ElevatedButton(
          onPressed: () => _onPressed(index),
          //color property
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(_areas[index].color),
          ),
          child: Text(
            _areas[index].name,
            textAlign: TextAlign.center,
          )),
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
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(16, (index) => _generate(index)),
            ),
          )),
    );
  }
}
