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
  int counter = 0;
  List<Widget> _list = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= 5; i++) {
      Widget child = _newItem(i);
      _list.add(child);
    }
  }

  void _onClicked() {
    Widget child = _newItem(counter);
    setState(() {
      _list.add(child);
    });
  }

  Widget _newItem(int i) {
    Key key = new Key("Item $i");
    Container child = new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text("$i Name here"),
        onDeleted: () =>
            _removeItem(key), //does not work with only writing _removeItem()
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: "Delete",
        avatar: CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text("$i"),
        ),
      ),
    );
    counter++;
    return child;
  }

  void _removeItem(Key ikey) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == ikey) {
        setState(
            () => _list.removeAt(i)); //it's always removeAt(i) not remove()
        print("Removing ${ikey.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClicked,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _list,
            ),
          ),
        ),
      ),
    );
  }
}
