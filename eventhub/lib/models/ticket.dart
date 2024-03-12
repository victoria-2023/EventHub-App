class Ticket {
  final int? id;
  final int eventId;
  final int userId;
  final String status; // e.g., "purchased", "cancelled"

  Ticket({this.id, required this.eventId, required this.userId, required this.status});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventId': eventId,
      'userId': userId,
      'status': status,
    };
  }

  static Ticket fromMap(Map<String, dynamic> map) {
    return Ticket(
      id: map['id'],
      eventId: map['eventId'],
      userId: map['userId'],
      status: map['status'],
    );
  }
}
