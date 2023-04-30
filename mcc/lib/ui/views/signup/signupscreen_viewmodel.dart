import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/ui/views/home/home_view.dart';
import 'package:mcc/ui/views/signup/signupform_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class SignUpScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  bool obscurePassword = true;
  bool obscurePasswordC = true;
  String password = '';
  String passwordC = '';
  String email = '';

  Future signUp(String email, String password, String confirmPassword, BuildContext context) async{
    if ((password == confirmPassword && password.length > 5) && email != '' && password != '') {
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView()));
      } on FirebaseAuthException catch (e){
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Errore..',
            text: 'Qualcosa è andato storto durante la registrazione!',
            confirmBtnColor: Colors.blueGrey
        );
      }
    }
    if((password != '' && password.length < 6) || (passwordC != '' && passwordC.length < 6)){
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Attenzione',
          text: 'La password deve essere di almeno 6 caratteri!',
          confirmBtnColor: Colors.blueGrey
      );
    }
    if(password != confirmPassword){
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Attenzione',
          text: 'Le due password devono corrispondere!',
          confirmBtnColor: Colors.blueGrey
      );
    }
    if(email == '' || password == '' || confirmPassword == ''){
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Attenzione',
          text: 'Compila tutti i campi per proseguire!',
          confirmBtnColor: Colors.blueGrey
      );
    }
  }

  void returnToLogin(){
    _navigationService.replaceWithLoginScreen();
  }

  bool get getSeePassword => obscurePassword;

  bool get getSeePasswordC => obscurePasswordC;

  String get getPassword => password;

  String get getPasswordC => passwordC;

  String get getEmail => email;

  void setSeePassword(){
    passwordC = passwordconfirmControllerR.text;
    password = passwordControllerR.text;
    email = emailController.text;
    obscurePassword = !obscurePassword;
    rebuildUi();
  }

  void setSeePasswordC(){
    passwordC = passwordconfirmControllerR.text;
    password = passwordControllerR.text;
    email = emailController.text;
    obscurePasswordC = !obscurePasswordC;
    rebuildUi();
  }
}