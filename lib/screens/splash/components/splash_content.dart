import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    this.text = "Welcome to Emanci!",
    this.image = "assets/images/splash_1.png",
    Key? key,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text("Emanci",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(64),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            )),
        Text(text, textAlign: TextAlign.center),),
        Spacer(flex: 2),
        Image.asset(image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235))
      ],
    );
  }
}
