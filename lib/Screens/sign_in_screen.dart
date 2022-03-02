import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:track_weight/controllers/sign_in_controller.dart';
final SignInController _controller = Get.find();
class SignIn extends StatelessWidget {
   SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*.85,
          //height:  MediaQuery.of(context).size.height*.5,
          child: ElevatedButton(
              onPressed: (){
              _controller.signIn();
              }, child:const Text("Sign in")),
        ),
      ),
    );
  }
}
