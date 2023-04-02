import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showSnackBar(String message) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showSnackBar('TODO: add todo item');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const TitleSection(title: 'Todo Categories', fontSize: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  IconLabel(
                    icon: Icon(Icons.school),
                    label: 'School',
                  ),
                  IconLabel(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  IconLabel(
                    icon: Icon(Icons.games),
                    label: 'Holiday',
                  ),
                  IconLabel(
                    icon: Icon(Icons.shopping_bag),
                    label: 'Shopping',
                  ),
                ],
              ),
              const TitleSection(title: 'Today Task', fontSize: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class IconLabel extends StatelessWidget {
  final Icon icon;
  final String label;
  const IconLabel({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            icon,
            const SizedBox(
              height: 8,
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class CardImage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const CardImage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TitleSection(title: title, fontSize: 14.0),
            Text(subtitle),
            const SizedBox(
              height: 8,
            ),
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ]),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleSection({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }
}
