import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dance_list_item.dart';
import 'dart:async';
import 'dart:convert';

class DetailPage extends StatefulWidget {
  var title;

  DetailPage(this.title);

  @override
  State<DetailPage> createState() {
    return new DetailPageState(title);
  }
}

class DetailPageState extends State<DetailPage> {

  var title;

  DetailPageState(this.title);

  @override
  void initState() {
    //loadDances();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black87,
          title: new Text(this.title),
        ),
        floatingActionButton: new FloatingActionButton(
            onPressed: () {
              print("test");
              //loadDances();
            }
        ),
        body: new Container(
            child: new Text("Detail Page")
        )
    );
  }
}

