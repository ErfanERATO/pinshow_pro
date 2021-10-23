import 'package:flutter/cupertino.dart';
import 'package:pinshow_pro/model/complete_form_response.dart';
import 'package:pinshow_pro/model/groups_data.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    debugPrint("database path is: $dbPath");
    return await sql.openDatabase(path.join(dbPath, 'userGroups.db'),
        onCreate: (db, version) {
          return db.execute(
              'CREATE TABLE user_groups('
                 'id INTEGER PRIMARY KEY,'
                 ' name TEXT,'
                 ' inviteCode TEXT,'
                 ' privateStatus TEXT,'
                 ' defaultGroup TEXT,'
                 ' generatedCodeTime TEXT,'
                 ' serverId INTEGER,'
                 ' expiredCodeTime TEXT)');
        }, version: 1);
  }


  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  // A method that retrieves all the dogs from the dogs table.
  static Future<List<GroupData>> readGroup() async {
    // Get a reference to the database.
    final db =await DBHelper.database();

    // Query the table for all The groups.
    final List<Map<String, dynamic>> maps =  await db.query('user_groups');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return GroupData(
        id: maps[i]['id'],
        name: maps[i]['name'],
        serverId: maps[i]['serverId'],
        inviteCode: maps[i]['inviteCode'],
        privateStatus: maps[i]['privateStatus'],
        defaultGroup: maps[i]['defaultGroup'],
        generatedCodeTime: maps[i]['generatedCodeTime'],
        expiredCodeTime: maps[i]['expiredCodeTime'],
      );
    });
  }
}
