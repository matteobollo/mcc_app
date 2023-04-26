import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mcc/ui/views/signup/signupscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../login/loginscreen_view.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignUpScreenViewModel viewModel = getParentViewModel(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: const Text(
            'OPPURE',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),
          ),
        ),
        const SizedBox(height: 25),
        TextButton(
            onPressed: viewModel.returnToLogin,
            child: Text.rich(
                TextSpan(
                    text: 'Hai già un Account? ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'Accedi',
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
