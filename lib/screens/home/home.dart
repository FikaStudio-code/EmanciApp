import 'package:e_commerce/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/enums.dart';
import 'package:e_commerce/screens/counselor/counselor_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/profile/profile_screen.dart';
import 'package:e_commerce/screens/wallet/wallet_screen.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Hoge extends StatelessWidget {
  static String routeName = "/sample";
  const Hoge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Home();
  }
}

class Home extends StatefulWidget {
  //static String routeName = "/hogehoge";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final Color inActiveIconColor = Color(0xFFB6B6B6);

  final List<Widget> _pageList = [
    HomeScreen(),
    CounselorScreen(),
    WalletScreen(),
    ProfileScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "ホーム"),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_location_outlined),
            label: "キャリコン",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: "ウォレット"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "アカウント"),
        ],
        unselectedItemColor: kSecondaryColor,
        selectedItemColor: Color(0xFFF28202),
      ),
    );
  }
}
