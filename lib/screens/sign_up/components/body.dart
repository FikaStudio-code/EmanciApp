import 'package:e_commerce/components/social_card.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_up/components/sign_up_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text("新規ユーザ登録", style: headingStyle),
              Text(
                "メールアドレスとパスワードを設定して \nアプリ用のアカウントを作成することができます。",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                      icon: "assets/icons/google-icon.svg", press: () {}),
                  SocialCard(icon: "assets/icons/facebook-2.svg", press: () {}),
                  SocialCard(icon: "assets/icons/twitter.svg", press: () {}),
                ],
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Text("続行することにより利用規約に\n同意することを確認してください",
                  textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
