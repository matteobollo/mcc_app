import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mcc/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import 'loginform_widget.dart';
GoogleSignIn googleSI = GoogleSignIn();

class LoginScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  bool seePassword = false;
  bool logged = true;
  String password = '';

  Future singIn(String email, String password, BuildContext context) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      logged = true;
    } on FirebaseAuthException catch (e) {
      logged = false;
      notifyListeners();
    }
  }

  bool get getSeePassword => seePassword;

  bool get getLogged => logged;

  String get getText => password;

  void setSeePassword(){
    password = passwordController.text;
    seePassword = !seePassword;
    rebuildUi();
  }

  void runAfterLogin(){
    _navigationService.replaceWithHomeView();
  }

  void runSignUp(){
    _navigationService.replaceWithSignUpScreenView();
  }

  void runForgotPassword(){
    _navigationService.replaceWithForgotPasswordView();
  }

  GoogleLogIn() async{
    final GoogleSignInAccount? googleUser = await googleSI.signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}