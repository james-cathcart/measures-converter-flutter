import 'package:flutter/material.dart';
import 'package:unit_converter/main.dart';
import 'package:unit_converter/util/conversion.dart';

class MyAppState extends State<MyApp> {

  String _startMeasure;
  String _convertedMeasure;
  double _numberFrom; // private member
  double _result = 0;
  String _resultMessage = '';

  @override
  Widget build(BuildContext context) {

    double sizeX = MediaQuery.of(context).size.width; // get device width
    double sizeY = MediaQuery.of(context).size.height; // get device height

    final TextStyle inputStyle =
        TextStyle(fontSize: 20, color: Colors.blue[900]);

    final TextStyle labelStyle =
        TextStyle(fontSize: 24, color: Colors.grey[700]);

    // create reuseable padding component
    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY/40));

    final List<String> _measures = [
      'meters',
      'kilometers',
      'grams',
      'kilograms',
      'feet',
      'miles',
      'pounds (lbs)',
      'ounces'
    ];

    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
          appBar: AppBar(
            title: Text("Measures Converter"),
          ),
          body: Container(
            width: sizeX,
              padding: EdgeInsets.all(sizeX/20),
              child: SingleChildScrollView(child: Column(children: [
                Text('Value', style: labelStyle),
                spacer,
                TextField(
                    style: inputStyle,
                    decoration: InputDecoration(
                        hintText: "Please insert the measure to be converted"),
                    onChanged: (text) {
                        setState(() {
                          _numberFrom = double.parse(text);
                        });
                      }
                    ),
                spacer,
                Text('From', style: labelStyle),
                DropdownButton(
                    isExpanded: true,
                    style: inputStyle,
                    value: _startMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: inputStyle,)
                      );
                    }).toList(),
                    onChanged: (value) {
                      onStartMeasureChanged(value);
                    },
                ),
                spacer,
                Text('To', style: labelStyle),
                spacer,
                DropdownButton(
                    isExpanded: true,
                    style: inputStyle,
                    value: _convertedMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: inputStyle));
                    }).toList(),
                    onChanged: (value) {
                      onConvertedMeasureChanged(value);
                    },
                ),
                RaisedButton(
                  child: Text('Convert', style: inputStyle),
                  onPressed: () => convert(),
                ),
                spacer,
                Text(
                  _resultMessage,
                  style: labelStyle,
                )
              ])))),
    );
  }

  void onStartMeasureChanged(String value) {
    setState(() {
      _startMeasure = value;
    });
  }

  void onConvertedMeasureChanged(String value) {
    setState(() {
      _convertedMeasure = value;
    });
  }

  void convert() {
    if (_startMeasure.isEmpty || _convertedMeasure.isEmpty || _numberFrom == 0) {
      return;
    }

    Conversion c = Conversion();
    double result = c.convert(
      _numberFrom,
      _startMeasure,
      _convertedMeasure
    );

    setState(() {

      _result = result;

      if (result == 0) {
        _resultMessage = 'This conversion cannot be performed';
      } else {
        _resultMessage =
        '${_numberFrom.toString()} $_startMeasure are ${_result.toString()} $_convertedMeasure';
      }
    });
  }
}
