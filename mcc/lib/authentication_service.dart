import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mcc/ui/views/home/home_view.dart';
import 'package:mcc/ui/views/login/loginscreen_view.dart';

class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  StreamBuilder<User?> handleAuthState(){
    return StreamBuilder<User?>(
      stream: _auth.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return const HomeView();
        } else{
          return const LoginScreenView();
        }
      }
    );
  }
}