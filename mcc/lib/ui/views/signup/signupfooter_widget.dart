import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mcc/ui/views/signup/signupscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.black)
            ),
            icon: SvgPicture.asset('assets/images/logoGoogle.svg', width: 20),
            label: const Text(
              'Registrati con Google',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
          ),
        ),
      ],
    );
  }
}
