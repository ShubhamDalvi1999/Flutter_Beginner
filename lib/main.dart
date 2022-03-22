import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

enum Animals { Cat, Dog, Bird, Lizard, Rabbit }

class _MyAppState extends State<MyApp> {
  Animals _selected = Animals.Cat;
  String _value = "Make a Selection";
  List<PopupMenuEntry<Animals>> _items = [];

  @override
  void initState() {
    super.initState();
    for (Animals animals in Animals.values) {
      _items.add(PopupMenuItem(
        child: Text(_getDisplay(
            animals)), //could work with Text("$animals"), but it displays Animals.Cat , Animals.rabbit etc
        value: animals,
      ));
    }
  }

  void _onSelected(Animals animals) {
    setState(() {
      _selected = animals;
      _value = "You Selected ${_getDisplay(animals)}";
    });
  }

  String _getDisplay(Animals animals) {
    int index = animals.toString().indexOf(".");
    index++;
    return animals.toString().substring(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(_value),
              ),
              PopupMenuButton<Animals>(
                  child: Icon(Icons.input),
                  initialValue: Animals.Cat,
                  onSelected: _onSelected,
                  itemBuilder: (BuildContext context) {
                    return _items;
                  })
            ],
          ),
        ),
      ),
    );
  }
}
