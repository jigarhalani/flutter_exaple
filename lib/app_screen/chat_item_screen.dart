import 'package:flutter/material.dart';

class ChatItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Chat Item'),
        backgroundColor: Colors.lightGreen,
      ),
      body: ChatItem(),
    );
  }
}

class ChatItem extends StatelessWidget {
  final leftSection = Container(
    padding: EdgeInsets.all(8.0),
      child: Column(
    children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(
            'https://www.indiewire.com/wp-content/uploads/2019/05/07956f40-77c4-11e9-9073-657a85982e73.jpg?w=780'),
        backgroundColor: Colors.lightGreen,
        radius: 24.0,
      ),
    ],
  ));

  final middleSection = Expanded(
    child: Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          Text(
            'Whatsup?',
            style: new TextStyle(color: Colors.grey),
          ),
        ],
      ),
    ),
  );

  final rightSection = new Container(
    padding: EdgeInsets.all(10.0),
    child: new Column(
      children: <Widget>[
        new Text("9:50",
          style: new TextStyle(
              color: Colors.lightGreen,
              fontSize: 15.0),),
        new CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 10.0,
          child: new Text("2",
            style: new TextStyle(color: Colors.white,
                fontSize: 15.0),),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[leftSection, middleSection, rightSection],
      ),
    );
  }
}
