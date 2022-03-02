

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:track_weight/controllers/sign_in_controller.dart';
import 'package:track_weight/controllers/storage_controller.dart';
import 'package:track_weight/model/model.dart';
import 'package:track_weight/widget/display_tile.dart';

import '../widget/alertbox.dart';
final StorageController _controller = Get.find();
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  var val=  _controller.readUsers();
  print("==============readFnValues: $val");
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight Tracker"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*.75,
          height: MediaQuery.of(context).size.height*.70,
          child: StreamBuilder<List<WeightModel>>(
            stream: _controller.readUsers(),
            builder: (context,snapshot){
              print("snapshot:==========${snapshot.data}");
              if(snapshot.hasError){
                return Text("Something went wrong:${snapshot.error}");
              }
             else if(snapshot.hasData){
                final users = snapshot.data;
                return ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context,index){
                    String weight =users[index].weight!;
                    String name   =users[index].name!;
                    return displayTile(
                      onTap: (){
                        addWeight(context: context,
                            isDelete: true,
                            onPressedDelete: (){
                          _controller.deleteEntry(docName: "$name${users[index].id}");
                            },
                            title: "edit details",
                            nameController: _controller.nameController,
                            weightController: _controller.weightController,
                            onPressed: (){
                          print("on pressfed working----------------");
                              _controller.updateWeight(
                                  docName:"$name${users[index].id}" ,
                                  weight: _controller.weightController.text,
                                  name: _controller.nameController.text);
                          _controller.clearFn();
                              Navigator.pop(context);
                            }
                        );
                      },
                        name: name,
                        weight: weight, date: users[index].time.toString());

                  },
                );
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        addWeight(context:context,title: "Enter Details",
        nameController: _controller.nameController,
        weightController:  _controller.weightController,
        onPressed: (){
          _controller.createUser(
              name:_controller.nameController.text.trim(),
              weight: _controller.weightController.text.trim(),
          );
          Navigator.pop(context);
          _controller.clearFn();
        });
      },
      child: Icon(Icons.add),),
    );
  }
}
