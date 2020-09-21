import 'package:flutter/material.dart';
import 'package:unit_converter/podos/MyAppState.dart';

void main() => runApp(
	MaterialApp(
		title: 'Measures Converter',
		home: MyApp()
		) // MaterialApp() wrapper is required for MediaQuery calls
	);

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();

}
