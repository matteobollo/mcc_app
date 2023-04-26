import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
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
              'Benvenuto!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
              )
          ),
        ),
        const Text(
          'Scegli un opzione per registrarti.',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300
          ),
        ),
      ],
    );
  }
}
