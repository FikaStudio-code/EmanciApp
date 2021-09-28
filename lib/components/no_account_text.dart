import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import '../screens/sign_up/sign_up_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("アカウントを登録していますか？",
            style: TextStyle(fontSize: getProportionateScreenWidth(10))),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, SignUpScreen.routeName)},
          child: Text("新規ユーザを登録する",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(10),
                  decoration: TextDecoration.underline,
                  color: kPrimaryColor)),
        ),
      ],
    );
  }
}
