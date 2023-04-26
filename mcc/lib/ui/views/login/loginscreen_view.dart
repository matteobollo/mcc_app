import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'loginfooter_widget.dart';
import 'loginform_widget.dart';
import 'loginheader_widget.dart';
import 'loginscreen_viewmodel.dart';

class LoginScreenView extends StackedView<LoginScreenViewModel>{
  const LoginScreenView({Key? key}) : super(key : key);

  @override
  Widget builder(
      BuildContext context,
      LoginScreenViewModel viewModel,
      Widget? child,
      ){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              LoginHeader(),
              LoginForm(),
              LoginFooter()
            ],
          )
        ),
      ),
    );
  }

  @override
  LoginScreenViewModel viewModelBuilder(BuildContext context) => LoginScreenViewModel();
}
