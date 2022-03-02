

import 'package:flutter/material.dart';
import 'package:track_weight/model/model.dart';
    displayTile({
  required String name,
      required String weight,
      required String date,
      required Function() onTap,

}){
      return ListTile(
        onTap: onTap,
        title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle:Text(date),
        trailing: Text(weight+" Kg"),
      );
    }

