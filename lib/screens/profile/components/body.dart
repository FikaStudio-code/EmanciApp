import 'package:e_commerce/screens/profile/components/profile_menu.dart';
import 'package:e_commerce/screens/profile/components/profile_pic.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        ProfilePic(),
        SizedBox(height: 40),
        ProfileMenu(
            text: "マイプロフィール", icon: "assets/icons/User Icon.svg", press: () {}),
        ProfileMenu(
            text: "設定", icon: "assets/icons/Settings.svg", press: () {}),
        ProfileMenu(
            text: "ヘルプセンター",
            icon: "assets/icons/Question mark.svg",
            press: () {}),
        ProfileMenu(
            text: "ログアウト",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.pushNamed(context, SplashScreen.routeName);
            }),
      ],
    );
  }
}
