import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Firestore _database;

  Future<Firestore> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }
  createDatabase() async {
  }

  Future onUpgrade() async {
  }

  Future initDB() async {
  }
}
