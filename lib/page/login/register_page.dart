import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:gonice/data/database/authentication.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register_page';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  var _passwordVisible = true;
  var _visible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 16,
              right: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Create Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('Nama Lengkap',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(
                    height: 10,
                  ),

                  /// KOLOM NAMA LENGKAP
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Email address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(
                    height: 10,
                  ),

                  /// KOLOM EMAIL
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
                    height: 10,
                  ),
                  const Text('Password',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
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

                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Height',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Weight',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama Lengkap tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  /// LOADING INDIKATOR
                  Visibility(
                    visible: _visible,
                    child: SpinKitRipple(
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
                        /// CEK APAKAH NAMA, EMAIL, DAN PASSWORD SUDAH TERISI DENGAN FORMAT YANG BENAR
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _visible = true;
                          });

                          bool shouldNavigate =
                              await Authentication.registerHandler(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (shouldNavigate) {
                            await Authentication.registeringUserToDatabase(
                              _nameController.text,
                              _emailController.text,
                              _passwordController.text,
                              _heightController.text,
                              _weightController.text,
                            );

                            setState(() {
                              _visible = false;
                              _formKey.currentState!.reset();
                              _showSuccessRegistration();
                              _emailController.clear();
                              _nameController.clear();
                              _passwordController.clear();
                              _heightController.clear();
                              _weightController.clear();
                            });
                          } else {
                            setState(() {
                              _visible = false;
                            });
                            _showFailureRegistration();
                          }
                        }
                      },
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',
                          style: TextStyle(color: Colors.grey)),
                      TextButton(
                        child: const Text('Login',
                            style: TextStyle(color: Colors.teal)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showSuccessRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          backgroundColor: Colors.teal,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: Text(
                  'Sukses Mendaftar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1,
                ),
                child: const Divider(
                  color: Colors.white,
                  height: 3,
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Anda berhasil terdaftar pada aplikasi Gonice\n\nSilahkan Login dengan akun anda',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 250,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Tutup",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          elevation: 10,
        );
      },
    );
  }

  _showFailureRegistration() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Gagal Registrasi"),
          content: const Text(
            'Anda gagal terdaftar dalam sistem Gonice, silahkan periksa data yang anda inputkan dan periksa koneksi internet, coba lagi kemudian',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
