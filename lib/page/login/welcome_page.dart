import 'package:gonice/page/login/login_page.dart';
import 'package:gonice/services/services.dart';
import 'package:gonice/viewmodel/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gonice/viewmodel/dashboard.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/welcome_page';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                repeat: ImageRepeat.repeat,
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/bckgr.jpg'))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png"),
                      const SizedBox(height: 10),
                      const Text(
                        "Best app for building your \n Fitness from home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.kDarkGreyColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.1),
                      SizedBox(
                        width: size.width * 0.8,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: const Text(
                            Constants.textSignIn,
                            style: TextStyle(color: Constants.kBlackColor),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Constants.kGreyColor),
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide.none)),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.8,
                        child: const GoogleSignIn(),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : SizedBox(
            width: size.width * 0.8,
            child: OutlinedButton.icon(
              icon: const FaIcon(
                FontAwesomeIcons.googlePlus,
                color: Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = new FirebaseService();
                try {
                  await service.signInwithGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Constants.homeNavigate, (route) => false);
                } catch (e) {
                  if (e is PlatformException) {
                    showMessage(e.message!);
                  }
                }
                setState(() {
                  isLoading = false;
                });
              },
              label: const Text(
                Constants.textSignInGoogle,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Constants.kGreyColor),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          );
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
