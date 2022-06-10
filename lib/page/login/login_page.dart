import 'package:belajar_firebase/screens/home_page.dart';
import 'package:belajar_firebase/screens/register_page.dart';
import 'package:belajar_firebase/services/authentikasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login_page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _passwordVisible = true;
  var _visible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 16,
          right: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello!! Welcome back!',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text('Email Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 8.0,
              ),

              //Email Colom
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email tidak boleh kosong';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Format Email tidak sesuai';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                height: 10,
              ),

              /// KOLOM Kata Sandi
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: _passwordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon((_passwordVisible)
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kata Sandi tidak boleh kosong';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              /// LOADING INDIKATOR
              Visibility(
                visible: _visible,
                child: const SpinKitRipple(
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 140,
                height: 45,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () async {
                    /// CEK APAKAH EMAIL DAN PASSWORD SUDAH TERISI DENGAN FORMAT YANG BENAR
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _visible = true;
                      });

                      /// CEK APAKAH EMAIL DAN PASSWORD SUDAH TERDAFTAR / BELUM
                      bool shouldNavigate = await Authentication.signInHandler(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (shouldNavigate) {
                        setState(() {
                          _visible = false;
                        });

                        _formKey.currentState!.reset();

                        /// MASUK KE HOMEPAGE JIKA SUKSES
                        Route route =
                            MaterialPageRoute(builder: (context) => HomePage());
                        Navigator.pushReplacement(context, route);
                      } else {
                        setState(() {
                          _visible = false;
                        });
                      }
                    }
                  },
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Do not have on account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => const RegisterPage());
                      Navigator.push(context, route);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.teal
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.teal,
      textColor: Colors.white,
      fontSize: 16.0);
}
