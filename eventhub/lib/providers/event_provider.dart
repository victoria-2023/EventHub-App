import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/database_service.dart';

class EventProvider with ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  void loadEvents() async {
    _events = await DatabaseService.instance.fetchEvents();
    notifyListeners();
  }

// Add methods for adding, updating, and removing events as needed.
}
