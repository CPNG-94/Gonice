import 'package:gonice/viewmodel/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
            const Hero(
              tag: 'LOGIN',
              child: Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Email Address',
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
                "Sign Up",
                style: TextStyle(color: Constants.kPrimaryColor),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Constants.kDarkBlueColor),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                try {
                  final email = _emailController.text;
                  final password = _passwordController.text;

                  await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pop(context);
                } catch (e) {
                  final snackbar = SnackBar(content: Text(e.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } finally {
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
            TextButton(
              child: const Text('Already have an account? Login'),
              onPressed: () => Navigator.pop(context),
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
