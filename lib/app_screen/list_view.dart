import 'package:flutter/material.dart';

List<String> getListElement() {
  var items = List<String>.generate(100, (counter) => "Item $counter");
  return items;
}

Widget getListView(context) {
  var listItems = getListElement();

  var listView = ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.keyboard),
          title: Text(listItems[index]),
          subtitle: Text('By List View'),
          trailing: Icon(Icons.add),
          onTap: () {
            print("${listItems[index]} tapped");
            showSnackBar(context,listItems[index]);
          },
        );
      });

  return listView;
}

void showSnackBar(BuildContext $context,String item) {
  var snackbar = SnackBar(
    content: Text("This is Dummy SnackBar Button for ${item}"),
    action: SnackBarAction(
        label: 'Undo', onPressed: () => print('Dummy Undo Clicked')),
  );

  Scaffold.of($context).showSnackBar(snackbar);
}

class RandomListViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing View Demo'),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.green,
      ),
      body: getListView(context),
    );
  }
}
