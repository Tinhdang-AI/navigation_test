class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String category;
  final DateTime dueDate;
  final List<Subtask> subtasks;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.subtasks,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      priority: json['priority'],
      category: json['category'],
      dueDate: DateTime.parse(json['dueDate']),
      subtasks: (json['subtasks'] as List)
          .map((item) => Subtask.fromJson(item))
          .toList(),
    );
  }
}

class Subtask {
  final int id;
  final String title;
  final bool isCompleted;

  Subtask({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }
}
