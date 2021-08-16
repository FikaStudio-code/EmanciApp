import 'package:e_commerce/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome to Emanci!!!!",
    },
    {
      "image": "assets/images/splash_2.png",
      "text": "Welcome to Emanci!!!!",
    },
    {
      "image": "assets/images/splash_3.png",
      "text": "Welcome to Emanci!!!!",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                          image: splashData[index]["image"].toString(),
                          text: splashData[index]["text"].toString(),
                        ))),
            Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
