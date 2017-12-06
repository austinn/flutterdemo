import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:listviewsample/models/dance.dart';
import 'detail.dart';
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

  List<Dance> data;

  Future<String> _loadJSONAsset() async {
    return await rootBundle.loadString('assets/dances.json');
  }

  Future loadDances() async {
    String jsonDances = await _loadJSONAsset();
    setData(jsonDances);
  }

  void setData(jsonString) {
    this.setState(() {
      data = new List<Dance>();
      List temp = JSON.decode(jsonString);
      for (var i = 0; i < temp.length; i++) {
        this.data.add(new Dance(temp[i]));
      }
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
          onPressed: () {}
      ),
      body: new ListView.builder(
          itemCount: (null == data) ? 0 : data.length,
          itemBuilder: _buildItem
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return new CardItem(
      onTap: () {
        Navigator.of(context).push(
            new PageRouteBuilder(
                pageBuilder: (BuildContext context, _, __) {
                  return new DetailPage(data[index].name);
                },
                transitionsBuilder: (_, Animation<double> animation, __,
                    Widget child) {
                  return new FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }
            )
        );
      },
      dance: data[index],
    );
  }
}

class CardItem extends StatelessWidget {

  final VoidCallback onTap;
  final Dance dance;

  CardItem({this.onTap, this.dance});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Container(
          child: new Text(dance.name),
          padding: new EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}

