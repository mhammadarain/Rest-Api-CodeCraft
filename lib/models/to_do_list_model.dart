class ToDoListModel {
  final int userId;
  final int id;
  final String title;
  final bool completed; // ✅ Remains final

  ToDoListModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoListModel.fromJson(Map<String, dynamic> json) {
    return ToDoListModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? "No Title",
      completed: json['completed'] ?? false,
    );
  }

  // ✅ Add copyWith method
  ToDoListModel copyWith({bool? completed}) {
    return ToDoListModel(
      userId: userId,
      id: id,
      title: title,
      completed: completed ?? this.completed,
    );
  }
}
