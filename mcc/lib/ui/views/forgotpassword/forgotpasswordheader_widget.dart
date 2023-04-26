import 'package:flutter/material.dart';

class PasswordForgotHeader extends StatelessWidget {
  const PasswordForgotHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Image(image: AssetImage('assets/images/LogoMCC.png'), width: 180,),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(height: 2, color: Colors.deepOrangeAccent,),
        ),
        const Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
              'Recupera la Password!',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w800,
              ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: const Text(
            'Inserisci la tua mail e reimposta la tua password.',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
