import 'package:flutter/material.dart';

class FavouriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FavouriteCityState();
  }
}

class FavouriteCityState extends State<FavouriteCity> {
  String cityName = '';
  String fullName = '';
  var _currency = ['rupees', 'dollers', 'aed', 'euro'];
  var _currencyItemSelected = 'rupees';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Example'),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  cityName = userInput;
                });
                print('Submitted event called');
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('User Clicked $cityName'),
            ),
            TextField(
              onChanged: (String username) {
                setState(() {
                  fullName = username;
                });
                print('kkk clicked $fullName');
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text('Your name is: $fullName'),
            ),
            DropdownButton(
              items: _currency.map((String dropDownItem){
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
              }).toList(),
              onChanged: (String newItem) {
                setState(() {
                  this._currencyItemSelected = newItem;
                });
              },
              value: this._currencyItemSelected,
            ),
          ],
        ),
      ),
    );
  }
}
