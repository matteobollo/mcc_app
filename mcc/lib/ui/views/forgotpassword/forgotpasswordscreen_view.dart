import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcc/ui/views/forgotpassword/forgotpasswordform_widget.dart';
import 'package:mcc/ui/views/forgotpassword/forgotpasswordheader_widget.dart';
import 'package:stacked/stacked.dart';

import 'forgotpasswordscreen_viewmodel.dart';

class ForgotPasswordScreenView extends StackedView<ForgotPasswordScreenViewModel>{
  const ForgotPasswordScreenView({Key? key}) : super(key : key);

  @override
  Widget builder(
      BuildContext context,
      ForgotPasswordScreenViewModel viewModel,
      Widget? child) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PasswordForgotHeader(),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: PasswordForgotForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ForgotPasswordScreenViewModel viewModelBuilder(BuildContext context) => ForgotPasswordScreenViewModel();
}