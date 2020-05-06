import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterBlock extends ChangeNotifier {
  int _counter = 11;

  int get counter => _counter;

  set counter(int val) {
    _counter = val;
    notifyListeners();
  }

  increment(){
    counter = counter + 1;
  }

  decrement(){
    counter = counter - 1;
  }
}

class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBlock cb = Provider.of<CounterBlock>(context);
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              cb.counter.toString(),
              style: TextStyle(fontSize: 55.0),
            ),
            RaisedButton(
              child: Icon(Icons.add),
              onPressed: (){
                cb.increment();
              },
            ),
            RaisedButton(
              child: Icon(Icons.remove),
              onPressed: (){
                cb.decrement();
              },
            )
          ],
        ),
      ),
    ));
  }
}
