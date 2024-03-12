class User {
  final int? id;
  final String name;
  final String email;
  final String password; // Consider storing passwords securely

  User({this.id, required this.name, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password, // Reminder: Store passwords securely
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'], // Reminder: Store passwords securely
    );
  }
}
