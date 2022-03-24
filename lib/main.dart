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
  late int _current;
  late List<Step> _items;

  @override
  void initState() {
    super.initState();
    _current = 0;
    _items = [
      Step(
          title: Text("Step 1"),
          content: Text("Do Something *0(doesn't even matter)"),
          isActive: true),
      Step(
          title: Text("Step 2"),
          content: Text("Do Something *0(doesn't even matter)"),
          isActive: true),
      Step(
          title: Text("Step 3"),
          content: Text("Do Something *0(doesn't even matter)"),
          isActive: true)
    ];
  }

  void _stepContinue() {
    setState(() {
      _current++;
      if (_current >= _items.length) {
        _current = _items.length - 1;
      }
    });
  }

  void _stepCancel() {
    setState(() {
      _current--;
      if (_current < 0) {
        _current = 0;
      }
    });
  }

  void _stepTap(int index) {
    setState(() {
      _current = index;
    });
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
              child: Stepper(
            steps: _items,
            type: StepperType.vertical,
            currentStep: _current,
            onStepCancel: _stepCancel,
            onStepContinue: _stepContinue,
            onStepTapped: _stepTap,
          )),
        ));
  }
}
