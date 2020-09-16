import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  static const String id = 'search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Search Page"),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.blueAccent[100],
          border: Border.all(width: 2, color: Colors.blueAccent[200])),
      child: Row(
        children: <Widget>[
          Text(
            "Search...",
            style: TextStyle(color: Colors.black26),
          ),
          Icon(
            Icons.search,
            color: Colors.black26,
            size: 32,
          )
        ],
      ),
    );
  }
}
