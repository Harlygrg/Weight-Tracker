import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/storage_controller.dart';
final StorageController _controller = Get.find();

addWeight({
  required context,
  String title="",
  required TextEditingController  nameController,
  required TextEditingController  weightController,
  required Function() onPressed,
   Function() ?onPressedDelete,
  bool isDelete=false,

}){
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text(title),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width*.60,
          height: MediaQuery.of(context).size.height*.30,
          child: Column(
            children: [
              TextFormField(
                decoration:const InputDecoration(
                  hintText: "Enter your name"
                ),
                controller: nameController
              ),
             const SizedBox(height: 10,),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration:const InputDecoration(
                hintText: "Enter your weight"
            ),
          controller:weightController,
        ),const SizedBox(height: 10,),
              SizedBox(
                width: MediaQuery.of(context).size.width*.85,
                //height:  MediaQuery.of(context).size.height*.5,
                child: ElevatedButton(
                    onPressed: onPressed, child:const Text("Submit")),
              ),
              isDelete?SizedBox(
                width: MediaQuery.of(context).size.width*.85,
                //height:  MediaQuery.of(context).size.height*.5,
                child: ElevatedButton(
                    onPressed: onPressedDelete, child:const Text("Delete")),
              ):const SizedBox(),

            ],
          ),
        )
      ],
    );

  });
}