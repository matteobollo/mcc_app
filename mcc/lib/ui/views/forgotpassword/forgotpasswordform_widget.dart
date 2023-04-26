import 'package:flutter/material.dart';
import 'package:mcc/ui/views/forgotpassword/forgotpasswordscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PasswordForgotForm extends StatelessWidget {
  const PasswordForgotForm({super.key,});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    ForgotPasswordScreenViewModel viewModel = getParentViewModel(context);
    return Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    prefixIcon: Icon(Icons.person_outline_outlined, color: Colors.orange,),
                    hintText: 'E-Mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)
                    )
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      viewModel.resetPassword(emailController.text, context);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),
                    ),
                    child: Text('RECUPERA PASSWORD')
                ),
              ),
            ],
          ),
        )
    );
  }
}