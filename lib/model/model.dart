

import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel{
    String id;
  final String ? name;
  final String ? weight;
  final DateTime ? time;

  WeightModel( {
     this.id="",
     this.name,
     this.time,
     this.weight
  });

  Map<String,dynamic> toJson()=>{
     "id": id,
    "name": name,
    "time":time,
    "weight":weight,
  };

  static WeightModel fromJson(Map<String,dynamic> json)=>WeightModel(
      id: json["id"],
      name: json["name"],
      time: (json["time"] as Timestamp).toDate(),
      weight:json["weight"]);

}
