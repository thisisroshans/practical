// To parse this JSON data, do
//
//     final launchHistory = launchHistoryFromJson(jsonString);

import 'dart:convert';

List<LaunchHistory> launchHistoryFromJson(String str) => List<LaunchHistory>.from(json.decode(str).map((x) => LaunchHistory.fromJson(x)));

String launchHistoryToJson(List<LaunchHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LaunchHistory {
  int id;
  String title;
  DateTime eventDateUtc;
  int eventDateUnix;
  int? flightNumber;
  String details;
  //Links links;

  LaunchHistory({
    required this.id,
    required this.title,
    required this.eventDateUtc,
    required this.eventDateUnix,
    required this.flightNumber,
    required this.details,
    //required this.links,
  });

  factory LaunchHistory.fromJson(Map<String, dynamic> json) => LaunchHistory(
    id: json["id"],
    title: json["title"] ?? "",
    eventDateUtc: DateTime.parse(json["event_date_utc"]),
    eventDateUnix: json["event_date_unix"],
    flightNumber: json["flight_number"],
    details: json["details"] ?? "",
   // links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title?? "",
    "event_date_utc": eventDateUtc.toIso8601String(),
    "event_date_unix": eventDateUnix,
    "flight_number": flightNumber,
    "details": details?? "",
    //"links": links.toJson(),
  };
}
class Links {
  String? reddit;
  String article;
  String? wikipedia;

  Links({
    this.reddit,
    required this.article,
    this.wikipedia,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    reddit: json["reddit"],
    article: json["article"],
    wikipedia: json["wikipedia"],
  );

  Map<String, dynamic> toJson() => {
    "reddit": reddit,
    "article": article,
    "wikipedia": wikipedia,
  };
}
