import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/database_service.dart';
import 'event_detail_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventHub'),
      ),
      body: FutureBuilder<List<Event>>(
        future: DatabaseService.instance.fetchEvents(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('An error occurred'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.name),
                subtitle: Text(event.date),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EventDetailView(event: event),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add event view
        },
        child: Icon(Icons.add),
      ),
    );
  }

  EventDetailView({required Event event}) {}
}
