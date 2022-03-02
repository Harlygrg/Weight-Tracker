import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:track_weight/Screens/home_page.dart';


class SignInController extends GetxController{

 FirebaseAuth auth = FirebaseAuth.instance;
    Future signIn()async{
     try{
       UserCredential userCreds = await auth.signInAnonymously();
         Get.to(()=>Home());
      // User? user = (await auth.signInAnonymously()).user;

       return userCreds;
     }on FirebaseAuthException catch (e){
        print(e.toString());
        return null;
     }
    }

}