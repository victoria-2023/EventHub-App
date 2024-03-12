class Event {
  final int? id;
  final String name;
  final String description;
  final String date;
  final String location;

  Event({this.id, required this.name, required this.description, required this.date, required this.location});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'location': location,
    };
  }

  static Event fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
      location: map['location'],
    );
  }
}
