import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gonice/data/database/authentication.dart';
import 'package:gonice/page/login/register_page.dart';
import 'package:gonice/viewmodel/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gonice/viewmodel/dashboard.dart';

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
      body: Stack(
        children: [
          Image.asset(
            "assets/bckgr.jpg",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 16,
                right: 16,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //Email Colom
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 1),
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
                          } else if (!value.contains('@') ||
                              !value.contains('.')) {
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
                    const Text(
                      'Kata Sandi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    /// KOLOM Kata Sandi
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 1),
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Atau Masuk dengan?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    /// LOADING INDIKATOR
                    Visibility(
                      visible: _visible,
                      child: const SpinKitRipple(
                        color: Color(0xfffbbb5b),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                                bool shouldNavigate =
                                    await Authentication.signInHandler(
                                  _emailController.text,
                                  _passwordController.text,
                                );

                                if (shouldNavigate) {
                                  setState(() {
                                    _visible = false;
                                  });

                                  _formKey.currentState!.reset();

                                  /// MASUK KE HOMEPAGE JIKA SUKSES
                                  Route route = MaterialPageRoute(
                                      builder: (context) =>
                                          const MyDashboard());
                                  Navigator.pushReplacement(context, route);
                                } else {
                                  setState(() {
                                    _visible = false;
                                  });
                                }
                              }
                            },
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 45,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => const RegisterPage());
                              Navigator.push(context, route);
                            },
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Pendaftaran',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
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
      backgroundColor: Colors.orange,
      textColor: Colors.white,
      fontSize: 16.0);
}
