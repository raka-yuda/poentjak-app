
import 'package:flutter/material.dart';
import 'package:test_app/assets/colors.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: darkBlue,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: darkBlue,
              ),
              SizedBox(width: 32),
              Icon(
                Icons.people,
                color: darkBlue,
              )
            ],
          )
        ],
      ),
    );
  }
}
