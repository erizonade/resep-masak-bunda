// To parse this JSON data, do
//
//     final kategoriModel = kategoriModelFromJson(jsonString);

import 'dart:convert';

KategoriModel kategoriModelFromJson(String str) => KategoriModel.fromJson(json.decode(str));

String kategoriModelToJson(KategoriModel data) => json.encode(data.toJson());

class KategoriModel {
    KategoriModel({
        required this.method,
        required this.status,
        required this.results,
    });

    String method;
    bool status;
    List<Result> results;

    factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        method: json["method"],
        status: json["status"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "method": method,
        "status": status,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.category,
        required this.url,
        required this.key,
    });

    String category;
    String url;
    String key;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"],
        url: json["url"],
        key: json["key"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "url": url,
        "key": key,
    };
}
