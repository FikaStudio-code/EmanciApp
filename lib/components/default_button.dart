import 'package:e_commerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 16),
          onPressed: () {
            Navigator.pushNamed(context, SignInScreen.routeName);
          },
          child: Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.white),
          )),
    );
  }
}
