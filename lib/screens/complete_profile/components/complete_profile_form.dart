import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/components/form_error.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_in/components/custom_suffix_icon.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String phoneNumber;
  late String address;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildFirstNameField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAddressFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
                text: "Continue",
                color: kPrimaryColor,
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // Check data and go to Top Page
                  }
                }),
          ],
        ));
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
        onSaved: (newValue) => address = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kAddressNullError)) {
            setState(() {
              errors.remove(kAddressNullError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kAddressNullError)) {
            setState(() {
              errors.add(kAddressNullError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Address",
            hintText: "Enter your address",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg")));
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
        keyboardType: TextInputType.number,
        onSaved: (newValue) => phoneNumber = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kPhoneNumberNullError)) {
            setState(() {
              errors.remove(kPhoneNumberNullError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kPhoneNumberNullError)) {
            setState(() {
              errors.add(kPhoneNumberNullError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Phone Number",
            hintText: "Enter your phone number",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg")));
  }

  TextFormField buildLastNameField() {
    return TextFormField(
        onSaved: (newValue) => lastName = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "Last Name",
            hintText: "Enter your last name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")));
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
        onSaved: (newValue) => firstName = newValue.toString(),
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kNameNullError)) {
            setState(() {
              errors.remove(kNameNullError);
            });
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: "First Name",
            hintText: "Enter your first name",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg")));
  }
}
