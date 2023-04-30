import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mcc/ui/views/home/home_view.dart';
import 'package:mcc/ui/views/login/loginscreen_view.dart';


class AuthenticationService{
  final FirebaseAuth auth = FirebaseAuth.instance;

  StreamBuilder<User?> handleAuthState(){
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const HomeView();
        } else{
          Future.delayed(Duration(seconds: 2)).then((value) => {FlutterNativeSplash.remove()});
          return const LoginScreenView();
        }
      }
    );
  }
}