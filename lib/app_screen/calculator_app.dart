import 'package:flutter/material.dart';

class calculatorForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _calculatorFormState();
  }
}

class _calculatorFormState extends State<calculatorForm> {
  var _currencies = ['rupees', 'dollers', 'euro'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
