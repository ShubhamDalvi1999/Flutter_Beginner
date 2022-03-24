import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

//the Custom Class that we want map with a widget to display on the main body
class Choice {
  final String title;
  final IconData icon;

  Choice({
    required this.title,
    required this.icon,
  });
}

//with TickerProviderStateMixin is a fix to the error of "vsync: this"

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late TabController _controller;
  List<Choice> _items = <Choice>[
    Choice(title: "Car", icon: Icons.directions_car),
    Choice(title: "Bicycle", icon: Icons.directions_bike),
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: _items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App2"),
          bottom: PreferredSize(
              child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch()
                          .copyWith(secondary: Colors.white)),
                  child: Container(
                    alignment: Alignment.center,
                    child: TabPageSelector(
                      controller: _controller,
                    ), //TabPageSelector controller
                  )),
              preferredSize: Size.fromHeight(48.0)),
        ),
        body: TabBarView(
          controller: _controller,
          //mapping object of each class to a WIDGET
          children: _items
              .map((Choice i) => Container(
                    padding: EdgeInsets.all(32.0),
                    child: Center(
                      child: Column(
                        children: [
                          Text(i.title),
                          Icon(i.icon, size: 120.0),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ));
  }
}
