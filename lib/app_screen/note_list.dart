import 'package:flutter/material.dart';
import 'package:my_app/app_screen/note_detail.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Note List'),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail("Add Note");
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getListView() {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Title'),
              subtitle: Text('Subtitle'),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                navigateToDetail("Edit Note");
              },
            ),
          );
        });
  }

  void navigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetailsForm(title);
    }));
  }
}
