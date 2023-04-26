import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'loginscreen_viewmodel.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginScreenViewModel viewModel = getParentViewModel(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'OPPURE',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => viewModel.GoogleLogIn(),
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.black)
            ),
            icon: SvgPicture.asset('assets/images/logoGoogle.svg', width: 20),
            label: const Text(
              'Accedi con Google',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
            onPressed: () => viewModel.runSignUp(),
            child: Text.rich(
                TextSpan(
                    text: 'Non hai un Account? ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'Registrati',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.orange
                          )
                      )
                    ]
                )
            )
        )
      ],
    );
  }
}
