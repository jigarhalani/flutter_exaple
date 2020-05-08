import 'package:flutter/material.dart';
import 'package:my_app/app_screen/calculator_app.dart';
import 'package:my_app/app_screen/chat_item_screen.dart';
import 'package:my_app/app_screen/list_view.dart';
import 'package:my_app/app_screen/note_detail.dart';
import 'package:my_app/app_screen/note_list.dart';
import 'package:my_app/app_screen/provider_demo.dart';
import 'package:my_app/app_screen/startup_namer.dart';
import 'package:my_app/app_screen/stateful_view_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

List<String> content = [
  '1',
  't2wo',
  'th3ree',
  'three',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
  'two',
  'three',
  'four',
  'one',
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterBlock>.value(
            value: CounterBlock(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter App",
          theme: ThemeData(
            primaryColor: Colors.indigo,
            accentColor: Colors.green,
            brightness: Brightness.light,
          ),
          routes: {
            '/second': (context) => ImageDemo(),
            '/third': (context) => RowDemo(),
            '/fourth': (context) => ColumnDemo(),
            '/fifth': (context) => ListViewDemo(),
            '/listview': (context) => RandomListViewExample(),
            '/statefullexample': (context) => FavouriteCity(),
            '/calculatorexample': (context) => CalculatorForm(),
            '/notes': (context) => NoteList(),
            '/providerDemo': (context) => ProviderDemo(),
            '/startupNammer': (context) =>RandomWord(),
            '/whatsapp': (context) =>ChatItemScreen(),
          },
          home: Home(),
        ));
  }
}

class Home extends StatelessWidget {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: () {
            this.counter += 1;
            print('Action clicked : ' + this.counter.toString());
          }),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('This is bar'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('Setting clicked');
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search button',
              onPressed: () {
                Navigator.pushNamed(context, '/second');
                print("Hello Search Clicked");
              }),
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {
              print('menu icon clicked');
            },
          )
        ],
      ),
      body: Center(
        child: Row(children: <Widget>[
          Column(children: <Widget>[
            Text.rich(
              TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text: " Worlddd",
                ),
                TextSpan(text: " Counter: " + this.counter.toString())
              ]),
            ),
            RaisedButton(
                child: Text('Click here'),
                onPressed: () {
                  bookFlight(context);
                }),
            RaisedButton(
                child: Text('List View Example'),
                onPressed: () {
                  Navigator.pushNamed(context, '/listview');
                }),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/statefullexample');
              },
              child: Text('StateFull Example'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculatorexample');
              },
              child: Text('Calculator Example'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notes');
              },
              child: Text('Notes Demo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/providerDemo');
              },
              child: Text('ProviderDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/startupNammer');
              },
              child: Text('Startup Nammer'),
            ),
            RaisedButton(onPressed:(){
                Navigator.pushNamed(context, '/whatsapp');
            },child: Text('Chat Screen'),)
          ]),
        ]),
      ),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Hello Welcome'),
      content: Text('Please wait while we are confirming your tickets'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/third');
                },
                child: Container(
                  width: 250.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    color: Colors.lightBlue,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://www.w3schools.com/w3css/img_snowtops.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment(0, 0),
                  child: Text(
                    'Text',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ))));
  }
}

class ImageFromAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 250.0,
                height: 300.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                  color: Colors.lightBlue,
                  image: DecorationImage(
                      image: AssetImage('assets/img_snowtops.jpg'),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment(0, 0),
                child: Text(
                  'Text',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ))));
  }
}

class IconButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                width: 250.0,
                height: 300.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0),
                ),
                alignment: Alignment(0, 0),
                child: IconButton(
                    icon: Icon(
                      Icons.mail,
                      size: 80.0,
                    ),
                    onPressed: () {
                      print('Pressed');
                    }))));
  }
}

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.mail,
              size: 60.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            }),
        Text(
          'Hello',
          style: TextStyle(fontSize: 70.0, color: Colors.blue),
        ),
        Icon(
          Icons.menu,
          size: 70.0,
        )
      ],
    ));
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.mail,
              size: 60.0,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/fifth');
            }),
        Text(
          'Hello',
          style: TextStyle(fontSize: 70.0, color: Colors.blue),
        ),
        Icon(
          Icons.menu,
          size: 70.0,
        )
      ],
    ));
  }
}

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.mail,
            size: 60.0,
          ),
          title: Text(
            'Send email',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 60.0,
          ),
          title: Text(
            'Setting',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.help,
            size: 60.0,
          ),
          title: Text(
            'HelP',
            style: TextStyle(fontSize: 40.0),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          leading: Icon(
            Icons.arrow_back,
            size: 60.0,
          ),
          title: Text(
            'HelP',
            style: TextStyle(fontSize: 40.0),
          ),
        )
      ],
    ));
  }
}

class DynamicListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: content.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(content[index]),
        );
      },
    ));
  }
}

class GestureDetactorButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this case nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If you change _counter without calling
      // setState(), then the build method won't be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return Row(
      children: <Widget>[
        FloatingActionButton(
          onPressed: _increment,
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: _decrement,
          child: Icon(Icons.remove),
        ),
        Text('Count: $_counter'),
      ],
    );
  }
}
