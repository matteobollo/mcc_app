import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:mcc/ui/views/signup/signupform_widget.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
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
    if (password == confirmPassword && email != '' && password != '') {
      try{
        var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
        print(user);
      } on FirebaseAuthException catch (e){
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Errore..',
            text: 'Qualcosa è andato storto durante la registrazione!',
            confirmBtnColor: Colors.blueGrey
        );
        print(e);
      }
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
    if(email == '' || password == '' || passwordC == ''){
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