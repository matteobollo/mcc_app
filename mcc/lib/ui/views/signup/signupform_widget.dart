import 'package:flutter/material.dart';
import 'package:mcc/ui/views/signup/signupscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key,});

  @override
  Widget build(BuildContext context) {
    SignUpScreenViewModel viewModel = getParentViewModel(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordconfirmController = TextEditingController();
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
                    prefixIcon: Icon(Icons.person_outline_outlined, color: Colors.orange,),
                    hintText: 'E-Mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)
                    )
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                cursorColor: Colors.orange,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.fingerprint, color: Colors.orange,),
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: true ? const Icon(Icons.visibility, color: Colors.orange,) : const Icon(Icons.visibility_off, color: Colors.orange,)
                    )
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordconfirmController,
                cursorColor: Colors.orange,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.fingerprint, color: Colors.orange,),
                    hintText: 'Conferma Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: true ? const Icon(Icons.visibility, color: Colors.orange,) : const Icon(Icons.visibility_off, color: Colors.orange,)
                    )
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      viewModel.signUp(emailController.text, passwordController.text, passwordconfirmController.text, context);
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