import 'package:flutter/material.dart';
import 'package:mcc/ui/views/signup/signupfooter_widget.dart';
import 'package:mcc/ui/views/signup/signupform_widget.dart';
import 'package:mcc/ui/views/signup/signupheader_widget.dart';
import 'package:mcc/ui/views/signup/signupscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignUpScreenView extends StackedView<SignUpScreenViewModel>{
  const SignUpScreenView({Key? key}) : super(key : key);

  @override
  Widget builder(
      BuildContext context,
      SignUpScreenViewModel viewModel,
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
                SignUpHeader(),
                SignUpForm(),
                SignUpFooter()
              ],
            )
        ),
      ),
    );
  }

  @override
  SignUpScreenViewModel viewModelBuilder(BuildContext context) => SignUpScreenViewModel();
}