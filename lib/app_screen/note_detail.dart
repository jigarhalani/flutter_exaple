import 'package:flutter/material.dart';

class NoteDetailsForm extends StatefulWidget {
  String appBarTitle;

  NoteDetailsForm(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailsFormState(this.appBarTitle);
  }
}

class NoteDetailsFormState extends State<NoteDetailsForm> {
  static var _priorities = ['high', 'low'];

  String appBarTitle;

  NoteDetailsFormState(this.appBarTitle);

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return WillPopScope(
        onWillPop: () {
          moveToLastScreen();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(this.appBarTitle),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                moveToLastScreen();
              },
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: DropdownButton(
                      items: _priorities.map((String dropDownItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownItem,
                          child: Text(dropDownItem),
                        );
                      }).toList(),
                      style: textStyle,
                      value: 'low',
                      onChanged: (value) {
                        setState(() {
                          print(value);
                        });
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      print('changed');
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      print('changed');
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          setState(() {
                            print('Button clicked');
                          });
                        },
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                      )),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                          child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        onPressed: () {
                          setState(() {
                            print('Delete clicked');
                          });
                        },
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }
}
