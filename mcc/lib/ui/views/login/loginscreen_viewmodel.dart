import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/authentication_service.dart';
import 'package:quickalert/quickalert.dart';
import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import 'loginform_widget.dart';

GoogleSignIn googleSI = GoogleSignIn();
GoogleSignInAccount? googleUser;

class LoginScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  bool obscurePassword = true;
  bool logged = true;
  String password = '';
  String email = '';

  Future singIn(String email, String password, BuildContext context) async{
    if (email != '' && password != '') {
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
        logged = true;
      } on FirebaseAuthException catch (e) {
        logged = false;
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: 'Errore..',
          text: 'Email e/o Password errate!',
            confirmBtnColor: Colors.blueGrey
        );
      }
    } else if(email == '' && password == ''){
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Attenzione',
          text: 'Compila tutti i campi!',
          confirmBtnColor: Colors.blueGrey
      );
    }
  }

  bool get getSeePassword => obscurePassword;

  bool get getLogged => logged;

  String get getText => password;

  String get getEmail => email;

  void setSeePassword(){
    password = passwordController.text;
    email = emailController.text;
    obscurePassword = !obscurePassword;
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
   googleUser = await googleSI.signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}