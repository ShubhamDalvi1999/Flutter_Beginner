import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget widget_body;

  MyItem({
    required this.isExpanded,
    required this.header,
    required this.widget_body,
  });
}

class _MyAppState extends State<MyApp> {
  List<MyItem> _items = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      _items.add(MyItem(
          isExpanded: false,
          header: "Item ${i}",
          widget_body: Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Hello World"),
          )));
    }
  }

  ExpansionPanel createiten(MyItem item) {
    return new ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return new Container(
              padding: new EdgeInsets.all(5.0),
              child: new Text("Header 5(item.header)"));
        },
        body: item.widget_body,
        isExpanded: item.isExpanded);
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
            children: [],
          ),
        ),
      ),
    );
  }
}
