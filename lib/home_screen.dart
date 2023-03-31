import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi $username',
                  ),
                  const Text('10 Task Pending'),
                ],
              ),
              const CircleAvatar(
                child: Icon(Icons.person_sharp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
