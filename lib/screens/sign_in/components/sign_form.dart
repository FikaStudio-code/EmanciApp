import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/login_success/login_success_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'custom_suffix_icon.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String password;
  late Response res;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          remember = true;
                        } else {
                          remember = false;
                        }
                      });
                    }),
                Text("パスワードを記憶する",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(10))),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: Text("パスワードを忘れた",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: getProportionateScreenWidth(10))),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
                text: "ログイン",
                color: kPrimaryColor,
                press: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    res = await postRequest(mail: email, pass: password);
                    if (res.statusCode == 200) {
                      Navigator.pushNamed(
                          context, LoginSuccessScreen.routeName);
                    } else if (res.statusCode != 200) {
                      Navigator.pushNamed(context, SplashScreen.routeName);
                    }
                  }
                })
          ],
        ));
  }

  Future<Response> postRequest(
      {required String mail, required String pass}) async {
    {
      Uri uri = Uri.http("118.27.23.90:8000", "test/login");
      res =
          await post(uri, body: json.encode({"email": mail, "password": pass}));
      return Future<Response>.value(res);
    }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => password = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPassNullError)) {
            setState(() {
              errors.remove(kPassNullError);
            });
          } else if (value.length >= 8 && errors.contains(kShortPassError)) {
            setState(() {
              errors.remove(kShortPassError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
            return "";
          } else if (value.length < 8 && !errors.contains(kShortPassError)) {
            setState(() {
              errors.add(kShortPassError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Password",
            hintText: "パスワードを入力して下さい",
            hintStyle: TextStyle(fontSize: getProportionateScreenWidth(12)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              errors.remove(kEmailNullError);
            });
          } else if (emailVailidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
            return "";
          } else if (!emailVailidatorRegExp.hasMatch(value) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Email",
            hintText: "Email アドレスを入力して下さい",
            hintStyle: TextStyle(fontSize: getProportionateScreenWidth(12)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")));
  }
}
