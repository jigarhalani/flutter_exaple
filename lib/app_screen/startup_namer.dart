import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordState extends State<RandomWord> {
  final wordPair = WordPair.random();

  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>(); // Add this line.
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Random Text Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: () {
            _pushSaved();
          })
        ],
      ),
      body: Container(
        child: Center(
          child: _buildSuggestions(),
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) {
              final Iterable<ListTile> tiles = _saved.map(
                      (WordPair pair) {
                    return ListTile(
                      title: Text(pair.asPascalCase, style: _biggerFont,),
                    );
                  }
              );
              final List<Widget> divided = ListTile.divideTiles(
                  tiles: tiles, context: context).toList();

              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('Saved Suggestions'),
                ),
                body: ListView(children: divided),
              );
            }
        )
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(color: Colors.blue,);
        /*2*/
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        final bool alreadySaved = _saved.contains(
            _suggestions[index]); // Add this line.
        return ListTile(
          trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : Colors.black,),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(_suggestions[index]);
              } else {
                _saved.add(_suggestions[index]);
              }
            });
          },
          title: Text(
            _suggestions[index].toString(),
            style: _biggerFont,
          ),
        );
      },
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RandomWordState();
  }
}
