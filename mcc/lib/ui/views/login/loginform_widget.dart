import 'package:flutter/material.dart';
import 'package:mcc/ui/views/login/loginscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';
final TextEditingController passwordController = TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({super.key,});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    LoginScreenViewModel viewModel = getParentViewModel(context);
    passwordController.text = viewModel.getText;
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
                controller: passwordController,
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
                        icon: viewModel.getSeePassword ? const Icon(Icons.visibility, color: Colors.orange,) : const Icon(Icons.visibility_off, color: Colors.grey,)
                    )
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: viewModel.runForgotPassword,
                    child: const Text(
                      'Password dimenticata?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                      ),
                    )
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()  {
                     viewModel.singIn(emailController.text, passwordController.text,context);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),
                    ),
                    child: Text('ACCEDI')
                ),
              ),
            ],
          ),
        )
    );
  }
}