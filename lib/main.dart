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
  int _val = 0;
  int _index = 0;
  String _value = "";

  void _add() => setState(() {
        _val++;
      });

  void _remove() => setState(() {
        _val--;
      });

  List<BottomNavigationBarItem> _navigate = [
    BottomNavigationBarItem(icon: Icon(Icons.back_hand), label: "Stop"),
    BottomNavigationBarItem(
        icon: Icon(Icons.forward_10_sharp), label: "Forward"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: Container(
          child: Column(children: [
            UserAccountsDrawerHeader(
              accountName: Text("Shubham Dalvi"),
              accountEmail: Text("abc@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                child: Text(
                  "S",
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ]),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "$_val",
                style: TextStyle(fontSize: 79),
              ),
              Text("$_value"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigate,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (newindex) {
          setState(() {
            _index = newindex;
            _value = "Current index is : $newindex";
          });
        },
      ),
    );
  }
}
