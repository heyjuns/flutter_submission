class Todo {
  bool checked;
  String task;
  String tags;

  Todo({required this.checked, required this.task, required this.tags});
}

var todoList = [
  Todo(tags: 'holiday', checked: false, task: 'Do nothing'),
  Todo(tags: 'holiday', checked: true, task: 'Do dishes'),
  Todo(tags: 'business', checked: false, task: 'Call Motorcycle services'),
  Todo(tags: 'business', checked: false, task: 'Fixing bugs'),
  Todo(tags: 'business', checked: true, task: 'Meeting with Sam'),
  Todo(tags: 'holiday', checked: true, task: 'Watering plants'),
  Todo(tags: 'School', checked: false, task: 'Pickup sisters'),
  Todo(tags: 'shopping', checked: false, task: 'Buy Groceries'),
];
