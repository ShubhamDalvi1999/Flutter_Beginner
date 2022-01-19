import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value1 = 0;
  int _value2 = 0;

  void _setvalue1(var value) => setState(() {
        _value1 = value;
      });

  void _setvalue2(var value) => setState(() {
        _value2 = value!;
      });

  Widget makeRadios() {
    List<Radio> list = [];

    for (var i = 0; i < 3; i++) {
      list.add(Radio(value: i, groupValue: _value1, onChanged: _setvalue1));
    }

    Column column = new Column(
      children: list,
    );

    return column;
  }

  Widget makeRadioTiles() {
    List<RadioListTile> list = [];

    for (var i = 0; i < 3; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: _value2,
        onChanged: _setvalue2,
        activeColor: Colors.green,
        title: Text("Radio tile $i click anywhere"),
        controlAffinity: ListTileControlAffinity.trailing,
      ));
    }

    Column column = new Column(
      children: list,
    );

    return column;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              makeRadios(),
              makeRadioTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
