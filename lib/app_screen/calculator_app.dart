import 'package:flutter/material.dart';

class CalculatorForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _calculatorFormState();
  }
}

class _calculatorFormState extends State<CalculatorForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['rupees', 'dollers', 'euro'];
  final _maximumPadding = 5.0;

  var _selectedCurrency = '';
  var _displayResult = '';

  void initState() {
    super.initState();
    _selectedCurrency = _currencies[1];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_maximumPadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                  padding: EdgeInsets.only(
                      top: _maximumPadding, bottom: _maximumPadding),
                  child: TextFormField(
                    style: textStyle,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter principal';
                      }
                    },
                    controller: principalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        labelText: 'Principal',
                        hintText: 'Enter Principal e.g 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _maximumPadding, bottom: _maximumPadding),
                  child: TextFormField(
                    controller: roiController,
                    keyboardType: TextInputType.number,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'ROI is required';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Rate of Interest',
                        hintText: 'In percentage e.g 12%',
                        errorStyle: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15.0,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _maximumPadding, bottom: _maximumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Term is required';
                          }
                        },
                        controller: termController,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Number of years',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Container(
                        width: _maximumPadding * 5,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        value: _selectedCurrency,
                        onChanged: (String selectedValue) {
                          _onItemChanged(selectedValue);
                        },
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _maximumPadding, bottom: _maximumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColorDark,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                this._displayResult = _calculateTotalReturns();
                              }
                            });
                          },
                          child: Text(
                            'Calculate',
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColor,
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                          child: Text(
                            'Reset',
                            textScaleFactor: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: _maximumPadding, bottom: _maximumPadding),
                  child: Text(
                    this._displayResult,
                    style: textStyle,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void _onItemChanged(String selectedValue) {
    setState(() {
      this._selectedCurrency = selectedValue;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double terms = double.parse(termController.text);
    double roi = double.parse(roiController.text);
    double totalAmountPayable = principal + (principal * roi * terms) / 100;

    String result =
        'After $terms years, your investment will be worth $totalAmountPayable $_selectedCurrency';

    return result;
  }

  void _reset() {
    _selectedCurrency = _currencies[1];
    principalController.text = '';
    termController.text = '';
    roiController.text = '';
    _displayResult = '';
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('assets/money.png');
    Image image = Image(
      image: assetImage,
      width: 120.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_maximumPadding * 10),
    );
  }
}
