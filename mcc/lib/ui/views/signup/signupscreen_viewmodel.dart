import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/ui/views/signup/signupform_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class SignUpScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  bool seePassword = false;
  bool seePasswordC = false;
  String password = '';
  String passwordC = '';

  Future signUp(String email, String password, String confirmPassword, BuildContext context) async{
    if (password == confirmPassword && email != null && password != null) {
      try{
        var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        print(user);
      } on FirebaseAuthException catch (e){
        rebuildUi();
        print(e);
      }
    }
  }

  void returnToLogin(){
    _navigationService.replaceWithLoginScreen();
  }

  bool get getSeePassword => seePassword;

  bool get getSeePasswordC => seePasswordC;

  String get getPassword => password;

  String get getPasswordC => passwordC;

  void setSeePassword(){
    password = passwordControllerR.text;
    seePassword = !seePassword;
    rebuildUi();
  }

  void setSeePasswordC(){
    passwordC = passwordconfirmControllerR.text;
    seePasswordC = !seePasswordC;
    rebuildUi();
  }
}