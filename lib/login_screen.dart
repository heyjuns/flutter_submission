import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_submission/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  _showSnackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'illustration',
              child: Image.asset(
                'images/icon.png',
                width: MediaQuery.of(context).size.width / 1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 56.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      label: Text('Username'),
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => HomeScreen(
                            username: _username.text,
                          ),
                        ),
                      );
                    },
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const Text(
                    'Or Continue With',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 11,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 40,
                        onPressed: () =>
                            _showSnackBar('TODO: Login With Facebook'),
                        icon: const Icon(
                          FontAwesomeIcons.facebook,
                          color: Color(0xFF4267B2),
                        ),
                      ),
                      IconButton(
                        iconSize: 40,
                        onPressed: () =>
                            _showSnackBar('TODO: Login With Whatsapp'),
                        icon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Color(0xFF25D366),
                        ),
                      ),
                      IconButton(
                        iconSize: 40,
                        onPressed: () =>
                            _showSnackBar('TODO: Login With Telegram'),
                        icon: const Icon(
                          FontAwesomeIcons.telegram,
                          color: Color(0xFF0088cc),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'not a member? ',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => _showSnackBar('TODO: Sign up'),
                          style: const TextStyle(
                              color: Colors.blueAccent, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
