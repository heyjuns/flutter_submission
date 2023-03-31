import 'package:flutter/material.dart';
import 'login_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Tugasmoo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      'Manage your',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'team & everything',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'with Tugasmoo',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Hero(
                  tag: 'illustration',
                  child: Image.asset(
                    'images/icon.png',
                    // height: 100,
                    // width: 20,
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: Text(
                    'When you are overwhelmed by the amount of work you have on your plate, stop, and rethink',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LoginScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                ),
                child: const Text('Lets Start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
