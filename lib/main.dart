import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// class MyItem {
//   bool isExpanded;
//   final String header;
//   final Widget widget_body;

//   MyItem({
//     required this.isExpanded,
//     required this.header,
//     required this.widget_body,
//   });
// }

class _MyAppState extends State<MyApp> {
  List<ExpansionPanel> _items = [];
  bool active = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      _items.add(ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return new Container(
                padding: new EdgeInsets.all(5.0), child: new Text("Item $i"));
          },
          body: Container(
            padding: EdgeInsets.all(10.0),
            child: Text("Hello $i"),
          ),
          isExpanded: active,
          canTapOnHeader: true));
    }
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
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  isExpanded = !isExpanded;
                  print("value of isExpanded:  $isExpanded");
                },
                children: _items,
                //mapping list of item ()
              )
            ],
          ),
        ),
      ),
    );
  }
}
