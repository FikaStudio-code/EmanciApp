import 'package:e_commerce/components/custom_bottom_nav_bar.dart';
import 'package:e_commerce/enums.dart';
import 'package:flutter/material.dart';

class CounselorScreen extends StatelessWidget {
  static String routeName = "/counselor";
  const CounselorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.counselor),
    );
  }
}
