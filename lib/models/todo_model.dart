class ToDo{
  final String title;
  final DateTime createAt;

  ToDo({required this.title, required this.createAt});

  @override
  String toString() {
    return 'ToDo{title: $title, createAt: $createAt}';
  }
}