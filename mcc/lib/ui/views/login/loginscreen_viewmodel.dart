import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class LoginScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  bool seePassword = false;

  Future singIn(String email, String password, BuildContext context) async{
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    
    _navigationService.popUntil((route) => route.isFirst);
  }

  bool get getSeePassword => seePassword;

  void setSeePassword(){
    seePassword = !seePassword;
    rebuildUi();
  }

  void runAfterLogin(){
    _navigationService.replaceWithHomeView();
  }

  void runSignUp(){
    _navigationService.replaceWithSignUpScreenView();
  }

}