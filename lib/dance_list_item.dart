import 'package:flutter/material.dart';

class _DanceListItem extends StatelessWidget {
  var name;

  _DanceListItem();

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(name),
    );
  }
}