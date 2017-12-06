import 'dart:convert';

class Dance {
  var id;
  var name;
  var choreographer;
  var rating;
  var level;

  Dance(json) {
    this.id = json["id"];
    this.name = json["name"];
    this.choreographer = json["choreographer"];
    this.rating = json["rating"];
    this.level = json["level"];
  }
//Dance({this.id, this.name, this.choreographer, this.rating, this.level});
}