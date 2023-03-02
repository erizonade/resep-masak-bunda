
import 'dart:convert';

ResepNowModel resepNowModelFromJson(String str) => ResepNowModel.fromJson(json.decode(str));
String resepNowModelToJson(ResepNowModel results) => json.encode(results.toJson());

class ResepNowModel {
  ResepNowModel({
    required this.method,
    required this.status,
    required this.listResults,
  });
  late final String method;
  late final bool status;
  late final List<ListResults> listResults;
  
  ResepNowModel.fromJson(Map<String, dynamic> json){
    method = json['method'];
    status = json['status'];
    listResults = List.from(json['results']).map((e)=>ListResults.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['method'] = method;
    _data['status'] = status;
    _data['results'] = listResults.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ListResults {
  ListResults({
    required this.title,
    required this.thumb,
    required this.key,
    required this.times,
    required this.serving,
    required this.difficulty,
  });
  late final String title;
  late final String thumb;
  late final String key;
  late final String times;
  late final String serving;
  late final String difficulty;
  
  ListResults.fromJson(Map<String, dynamic> json){
    title = json['title'];
    thumb = json['thumb'];
    key = json['key'];
    times = json['times'];
    serving = json['serving'];
    difficulty = json['difficulty'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['thumb'] = thumb;
    _data['key'] = key;
    _data['times'] = times;
    _data['serving'] = serving;
    _data['difficulty'] = difficulty;
    return _data;
  }
}