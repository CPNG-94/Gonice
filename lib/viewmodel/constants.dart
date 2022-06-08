const String apiKey = "6ace2996147146779027ae5a0c837f3c";

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  //colors
  static const kPrimaryColor = Color(0xFFFFFFFF);
  static const kGreyColor = Color(0xFFEEEEEE);
  static const kBlackColor = Color(0xFF000000);
  static const kDarkGreyColor = Color(0xFF9E9E9E);
  static const kDarkBlueColor = Color(0xFF6057FF);
  static const kBorderColor = Color(0xFFEFEFEF);
  static const kButtonColor = Color.fromARGB(24, 143, 121, 1);

  //text
  static const title = "Google Sign In";
  static const textSignIn = "Sign In with Email";
  static const textSmallSignIn = "You've been missed";
  static const textSignInGoogle = "Sign In With Google";
  static const textHome = "Home";

  //navigate
  static const homeNavigate = '/home';
  static const welcomePage = '/welcome';
  static const registerPage = '/register';
  static const loginPage = '/login';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.kPrimaryColor,
      statusBarIconBrightness: Brightness.light);
}
