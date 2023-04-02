import 'package:flutter/material.dart';
import 'package:flutter_submission/models/todo_list.dart';

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
        backgroundColor: const Color(0xFF7E57C2),
        onPressed: () {
          _showSnackBar('TODO: add todo item');
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
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
                        username != '' ? 'Hi $username' : 'Hi User',
                        style: const TextStyle(
                            color: Color(0xFF7E57C2),
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                          '${todoList.where((todo) => todo.checked == false).length} Task Pending'),
                    ],
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
              const TodoList(),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Expanded(
          flex: 1,
          child: ListView(
            children: todoList.map((todo) {
              return Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(todo.task),
                    value: todo.checked,
                    activeColor: const Color(0xFF7E57C2),
                    onChanged: (bool? value) {
                      setState(() => todo.checked = value!);
                    }),
              );
            }).toList(),
          ),
        );
      },
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
