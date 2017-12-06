import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
            Navigator.of(context).push(
                new PageRouteBuilder(
                    pageBuilder: (BuildContext context, _, __) {
                      return new DetailPage("yolo");
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
          }
      ),
      body: new ListView.builder(
          itemCount: (null == data) ? 0 : data.length,
          itemBuilder: _buildItem
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return new CardItem(
            () {
          Navigator.of(context).push(
              new PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) {
                    return new DetailPage(data[index]["name"]);
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
        data[index]["name"]
    );
  }
}

class CardItem extends StatelessWidget {

  VoidCallback onTap;
  var text;

  CardItem(this.onTap, this.text);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Container(
          child: new Text(this.text),
          padding: new EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}

