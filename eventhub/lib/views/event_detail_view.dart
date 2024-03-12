import 'package:flutter/material.dart';
import '../models/event.dart';

class EventDetailView extends StatelessWidget {
  final Event event;

  const EventDetailView({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(event.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(event.date, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(event.description),
          ],
        ),
      ),
    );
  }
}
