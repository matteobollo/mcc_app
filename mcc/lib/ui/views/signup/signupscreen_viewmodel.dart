import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class SignUpScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  Future signUp(String email, String password, String confirmPassword, BuildContext context) async{
    showDialog(
        context: context,
        builder: (context) => Center(child: CircularProgressIndicator())
    );

    if (password == confirmPassword) {
      try{
        var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        print(user);
      } on FirebaseAuthException catch (e){
        rebuildUi();
        print(e);
      }
    }
  }
}