import 'dart:convert';

class Todo {
  int id;
  String title;
  String description;
  bool status;
  String priority;

  Todo({this.id, this.title, this.description, this.status, this.priority}) {
    id = this.id;
    title = this.title;
    description = this.description;
    status = this.status;
    priority = this.priority;
  }

  toJson() {
    return {
      "id": id,
      "description": description,
      "title": title,
      "status": status,
      "priority": priority
    };
  }

  fromJson(jsonData) {
    return Todo(
        id: jsonData['id'],
        title: jsonData['title'],
        description: jsonData['description'],
        status: jsonData['status'],
        priority: jsonData['priority']);
  }
}
