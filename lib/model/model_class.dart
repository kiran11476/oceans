// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelClass modelClassFromJson(String str) =>
    ModelClass.fromJson(json.decode(str));

String modelClassToJson(ModelClass data) => json.encode(data.toJson());

class ModelClass {
  ModelClass({
    required this.count,
    required this.entries,
  });

  int count;
  List<Entry>? entries;

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        count: json["count"] == null ? null : json["count"],
        entries: json["entries"] == null
            ? null
            : List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "entries": entries == null
            ? null
            : List<dynamic>.from(entries!.map((x) => x.toJson())),
      };
}

class Entry {
  Entry({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  String api;
  String description;
  String auth;
  bool https;
  String cors;
  String link;
  String category;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"] == null ? null : json["API"],
        description: json["Description"] == null ? null : json["Description"],
        auth: json["Auth"] == null ? null : json["Auth"],
        https: json["HTTPS"] == null ? null : json["HTTPS"],
        cors: json["Cors"] == null ? null : json["Cors"],
        link: json["Link"] == null ? null : json["Link"],
        category: json["Category"] == null ? null : json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api == null ? null : api,
        "Description": description == null ? null : description,
        "Auth": auth == null ? null : auth,
        "HTTPS": https == null ? null : https,
        "Cors": cors == null ? null : cors,
        "Link": link == null ? null : link,
        "Category": category == null ? null : category,
      };
}
