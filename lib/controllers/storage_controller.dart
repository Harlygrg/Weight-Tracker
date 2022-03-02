

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:track_weight/model/model.dart';

class StorageController extends GetxController{
    int count =0;


    TextEditingController nameController= TextEditingController();
    TextEditingController weightController= TextEditingController();

    TextEditingController nameEditController= TextEditingController();
    TextEditingController weightEditController= TextEditingController();


    clearFn(){
      nameController.clear();
      weightController.clear();
    }
    prefSet()async{
      final pref = await SharedPreferences.getInstance();
      pref.setInt("count", count);
    }
    prefGet()async{
      final pref = await SharedPreferences.getInstance();
     count =pref.getInt("count")!;
     return count;
    }

    Future createUser({required String name,required String weight,})async{
      count=count+1;
      prefSet();
      final docUser =FirebaseFirestore.instance.collection("users").doc(name +"${prefGet()}");
      var user = WeightModel(name: name, time: DateTime.now(), weight: weight,id: "$count");
        final json = user.toJson();
      await docUser.set(json);

    }


    Stream<List<WeightModel>> readUsers()=>FirebaseFirestore.instance.collection("users").orderBy("time",descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => WeightModel.fromJson(doc.data())).toList());

    updateWeight({required String docName,required String weight,required String name})async{
      print("----doc name:-----$docName");
      final docUser = FirebaseFirestore.instance.collection("users").doc(docName);
    await docUser.update({
        "weight":weight,
        "name":name
      });

    }

    deleteEntry({required String docName})async{
      print("--------delete fn ::$docName");
      final docUser = FirebaseFirestore.instance.collection("users").doc(docName);
      await docUser.delete();
      Get.back();
    }


}