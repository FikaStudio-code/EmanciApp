import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/components/social_card.dart';
import 'package:e_commerce/screens/sign_in/components/sign_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("ログイン",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold)),
              Text("登録した Email アドレスとパスワード\nもしくは SNS アカウントでログインできます",
                  textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SignForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: "assets/icons/google-icon.svg", press: () {}),
                  SocialCard(icon: "assets/icons/facebook-2.svg", press: () {}),
                  SocialCard(icon: "assets/icons/twitter.svg", press: () {}),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              NoAccountText(),
            ],
          ),
        ),
      ),
    ));
  }
}
