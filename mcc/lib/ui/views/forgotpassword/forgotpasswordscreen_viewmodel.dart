import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mcc/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class ForgotPasswordScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  Future resetPassword(String email, BuildContext context) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      returnToLogin();
    } on FirebaseAuthException catch(e){
      print(e);
    }
  }

  void returnToLogin(){
    _navigationService.replaceWithLoginScreen();
  }
}

