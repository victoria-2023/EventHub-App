import 'package:flutter/material.dart';
// Assuming you have a User model

class UserProfileView extends StatelessWidget {
  // Example user details, in a real app, fetch these from your database or API
  final String userName = 'John Doe';
  final String userEmail = 'john.doe@example.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: $userName', style: TextStyle(fontSize: 20)),
            Text('Email: $userEmail', style: TextStyle(fontSize: 20)),
            // Add more profile information here
          ],
        ),
      ),
    );
  }
}
