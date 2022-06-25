import 'package:flutter/material.dart';

class Mysearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query == "") {
              Navigator.pop(context);
            } else {
              query = "";
            }
          },
          icon: Icon(Icons.close))
    ];
    throw UnimplementedError();
  }

  @override
  buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text('selectedResult'),
      ),
    );
    throw UnimplementedError();
  }

  @override
  buildSuggestions(BuildContext context) {
    List<String> Suggestions = [
      'Brazil'
      'China'
      'USA'
      'Russia'
      'Korea'
    ];

    return ListView.builder(itemCount: Suggestions.length,
      itemBuilder: (context, index),) {
      final suggestion = Suggestions[index];


    };


    throw UnimplementedError();
  }
}
