class TodoModel {
  String id;
  String title;
  String description;
  DateTime date;
  bool isComplete;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isComplete = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'isComplete': isComplete,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      isComplete: json['isComplete'],
    );
  }
}
