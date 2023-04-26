import 'package:flutter/material.dart';
import 'package:mcc/ui/views/signup/signupscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
final TextEditingController passwordControllerR = TextEditingController();
final TextEditingController passwordconfirmControllerR = TextEditingController();

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key,});

  @override
  Widget build(BuildContext context) {
    SignUpScreenViewModel viewModel = getParentViewModel(context);
    final TextEditingController emailController = TextEditingController();
    passwordconfirmControllerR.text = viewModel.getPasswordC;
    passwordControllerR.text = viewModel.getPassword;
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
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordControllerR,
                cursorColor: Colors.orange,
                obscureText: viewModel.getSeePassword,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    prefixIcon: const Icon(Icons.fingerprint, color: Colors.orange,),
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: viewModel.setSeePassword,
                        icon: viewModel.getSeePassword ? const Icon(Icons.visibility, color: Colors.orange,) : Icon(Icons.visibility_off, color: Colors.orange,)
                    )
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordconfirmControllerR,
                cursorColor: Colors.orange,
                obscureText: viewModel.getSeePasswordC,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange
                        )
                    ),
                    prefixIcon: const Icon(Icons.fingerprint, color: Colors.orange,),
                    hintText: 'Conferma Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: viewModel.setSeePasswordC,
                        icon: viewModel.getSeePasswordC ? const Icon(Icons.visibility, color: Colors.orange,) : Icon(Icons.visibility_off, color: Colors.orange,)
                    )
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      viewModel.signUp(emailController.text, passwordControllerR.text, passwordconfirmControllerR.text, context);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),
                    ),
                    child: Text('REGISTRATI')
                ),
              ),
            ],
          ),
        )
    );
  }
}