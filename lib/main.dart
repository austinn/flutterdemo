import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dance_list_item.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> _loadJSONAsset() async {
    return await rootBundle.loadString('assets/dances.json');
  }

  Future loadDances() async {
    String jsonDances = await _loadJSONAsset();
    setData(jsonDances);
  }

  void setData(json) {
    this.setState(() {
      data = JSON.decode(json);
    });
  }

  @override
  void initState() {
    loadDances();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        title: new Text("Listview Sample"),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {
            loadDances();
          }
      ),
      body: new ListView.builder(
        itemCount: (null == data) ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
              child: _listRowItemDance(data[index]['name']),
          );
        },
      ),
    );
  }

  Widget _listRowItemDance(text) {
    return new Container(
      child: new Text(text),
      padding: new EdgeInsets.all(12.0),
    );
  }
}

