import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user.dart'; // Ensure this path matches your project structure
import '../models/event.dart'; // Ensure you have an Event model

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('eventhub.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, filePath);
    return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
        onConfigure: _onConfigure // Enabling foreign key support
    );
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE events (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT, 
      description TEXT, 
      date TEXT, 
      location TEXT
    )''');

    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT, 
      email TEXT, 
      password TEXT
    )''');

    await db.execute('''
    CREATE TABLE tickets (
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      eventId INTEGER, 
      userId INTEGER, 
      status TEXT, 
      FOREIGN KEY(eventId) REFERENCES events(id), 
      FOREIGN KEY(userId) REFERENCES users(id)
    )''');
  }

  // CRUD operations for User
  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> fetchAllUsers() async {
    final db = await database;
    final result = await db.query('users');
    return result.map((json) => User.fromMap(json)).toList();
  }

  // Implementing fetchEvents method
  Future<List<Event>> fetchEvents() async {
    final db = await database;
    final result = await db.query('events');
    return result.map((json) => Event.fromMap(json)).toList();
  }

  // Close database
  Future close() async {
    final db = await database;
    if (db.isOpen) await db.close();
  }
}

openDatabase(String path, {required int version, required Future Function(dynamic db, int version) onCreate, required Future Function(dynamic db) onConfigure}) {
}
