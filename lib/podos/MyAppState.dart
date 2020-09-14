import 'package:flutter/material.dart';
import 'package:unit_converter/main.dart';

class MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
          appBar: AppBar(
            title: Text("Measures Converter"),
          ),
          body: Center(
            child: Text('Measures Converter'),
          )),
    );
  }
}
