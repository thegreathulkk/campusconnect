import 'dart:convert';

class Event {
  final String name;
  final String description;
  final String location;
  final String date;
  final String author;
  final String? id;

  Event({
    required this.name,
    required this.description,
    required this.location,
    required this.date,
    required this.author,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'date': date,
      'author': author,
      'id': id,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      date: map['date'] ?? '',
      author: map['author'] ?? '',
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
