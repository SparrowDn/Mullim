import 'package:flutter/material.dart';

class Mysearch extends SearchDelegate {

  List<String> searchResults =   ['book', 'shoe', 'laptop', 'others', 'maybe'];

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
        child: Text(query),
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();





    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;

              showResults(context);
            },
          );
        });
    throw UnimplementedError();
  }
}
