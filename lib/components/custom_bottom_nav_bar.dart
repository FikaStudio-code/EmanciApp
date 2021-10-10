import 'package:e_commerce/constants.dart';
import 'package:e_commerce/enums.dart';
import 'package:e_commerce/screens/counselor/counselor_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.15),
            )
          ]),
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Shop Icon.svg"),
            color: MenuState.home == selectedMenu
                ? kPrimaryColor
                : inActiveIconColor,
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.edit_location_outlined),
            color: MenuState.counselor == selectedMenu
                ? kPrimaryColor
                : inActiveIconColor,
            onPressed: () {
              Navigator.pushNamed(context, CounselorScreen.routeName);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_balance_wallet_outlined),
            color: MenuState.wallet == selectedMenu
                ? kPrimaryColor
                : inActiveIconColor,
            onPressed: () {
              Navigator.pushNamed(context, WalletScreen.routeName);
            },
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/User Icon.svg"),
            color: MenuState.profile == selectedMenu
                ? kPrimaryColor
                : inActiveIconColor,
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
          ),
        ],
      )),
    );
  }
}
