import 'package:gonice/page/home/home_page.dart';
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
  final _auth = FirebaseAuth.instance;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.teal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            Hero(
              tag: 'LOGIN',
              child: Text(
                'Hello!! Welcome Back!',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Email Address ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 24.0),
            OutlinedButton(
                child: const Text(
                  "Login",
                  style: TextStyle(color: Constants.kPrimaryColor),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Constants.kDarkBlueColor),
                    side:
                        MaterialStateProperty.all<BorderSide>(BorderSide.none)),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  try {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyDashboard()));
                  } catch (e) {
                    final snackbar = SnackBar(content: Text(e.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }),
            TextButton(
              child: const Text('Do not have on account? Sign Up'),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage())),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
