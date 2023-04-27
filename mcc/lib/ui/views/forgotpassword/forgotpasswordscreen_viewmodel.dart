import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcc/app/app.router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class ForgotPasswordScreenViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();

  Future resetPassword(String email, BuildContext context) async{
    if (email != '') {
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
        returnToLogin();
      } on FirebaseAuthException catch(e){
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
    if(email == ''){
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Attenzione',
          text: 'La mail deve essere valida!',
          confirmBtnColor: Colors.blueGrey
      );
    }
  }

  void returnToLogin(){
    _navigationService.replaceWithLoginScreen();
  }
}

