import 'package:flutter/material.dart';
import 'package:pinshow_pro/model/login_response_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const String databaseName = 'login_database.db';

//_____________________________________________________________________________

  static const String tableGroupName1 = 'table_login_data';
  static const String cId = 'id';
  static const String cToken = 'token';
  static const int version = 1;

//_____________________________________________________________________________

  static const String tableGroupName2 = 'table_login_group';
  static const String c2Id = 'id';
  static const String c2Name = 'name';
  static const String c2InviteCode = 'inviteCode';
  static const String c2PrivateStatus = 'privateStatus';
  static const String c2GroupDefault = 'groupDefault';
  static const String c2GroupPhoto = 'groupPhoto';
  static const String c2GeneratedCodeTime = 'generatedCodeTime';
  static const String c2ExpiredCodeTime = 'expiredCodeTime';

//_____________________________________________________________________________

  static const String tableGroupName3 = 'table_login_user';
  static const String c3Id = 'id';
  static const String c3Name = 'name';
  static const String c3Email = 'email';
  static const String c3Phone = 'phone';
  static const String c3UserProfilePath = 'userProfilePath';

  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    debugPrint("database path is: $dbPath");
    return await sql.openDatabase(path.join(dbPath, databaseName),
        onCreate: (db, version) {
      db.execute('CREATE TABLE $tableGroupName3('
          ' $c3Id INTEGER PRIMARY KEY,'
          ' $c3Name TEXT,'
          ' $c3Email TEXT,'
          ' $c3Phone TEXT,'
          ' $c3UserProfilePath TEXT)');

      db.execute('CREATE TABLE $tableGroupName2('
          ' $c2Id INTEGER PRIMARY KEY,'
          ' $c2Name TEXT,'
          ' $c2InviteCode TEXT,'
          ' $c2PrivateStatus TEXT,'
          ' $c2GroupDefault TEXT,'
          ' $c2GroupPhoto TEXT,'
          ' $c2GeneratedCodeTime TEXT,'
          ' $c2ExpiredCodeTime TEXT)');

      return db.execute('CREATE TABLE $tableGroupName1('
          ' $cId INTEGER PRIMARY KEY,'
          ' $cToken TEXT)');
    }, version: version);
  }

  Future<void> insertLoginData(Map<String, dynamic> data) async {
    final db = await DataBaseHelper.database();
    db.insert(
      tableGroupName1,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Data>> retrieveLoginData() async {
    final db = await DataBaseHelper.database();
    final List<Map<String, dynamic>> maps = await db.query(tableGroupName1);
    return List.generate(maps.length, (i) {
      return Data(
        token: maps[i]['token'],
        user: maps[i]['user'],
        groups: maps[i]['groups'],
      );
    });
  }

  Future<void> updateLoginData(Data data) async {
    final db = await DataBaseHelper.database();
    await db.update(
      tableGroupName1,
      data.toMap(),
      where: 'token = ?',
      whereArgs: [data.token],
    );
  }

  //_________________________________________________________________________

  Future<void> insertLoginGroup(Map<String, dynamic> data) async {
    final db = await DataBaseHelper.database();
    db.insert(
      tableGroupName2,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Group>> retrieveLoginGroup() async {
    final db = await DataBaseHelper.database();
    final List<Map<String, dynamic>> maps = await db.query(tableGroupName2);
    return List.generate(maps.length, (i) {
      return Group(
        name: maps[i]['name'],
        id: maps[i]['id'],
        inviteCode: maps[i]['inviteCode'],
        privateStatus: maps[i]['privateStatus'],
        groupDefault: maps[i]['groupDefault'],
        groupPhoto: maps[i]['groupPhoto'],
        generatedCodeTime: maps[i]['generatedCodeTime'],
        expiredCodeTime: maps[i]['expiredCodeTime'],
      );
    });
  }

  Future<void> updateLoginGroup(Group group) async {
    final db = await DataBaseHelper.database();
    await db.update(
      tableGroupName2,
      group.toMap(),
      where: 'id = ?',
      whereArgs: [group.id],
    );
  }

//_________________________________________________________________________

  Future<void> insertLoginUser(Map<String, dynamic> data) async {
    final db = await DataBaseHelper.database();
    db.insert(
      tableGroupName3,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> retrieveLoginUser() async {
    final db = await DataBaseHelper.database();
    final List<Map<String, dynamic>> maps = await db.query(tableGroupName3);
    return List.generate(maps.length, (i) {
      return User(
        name: maps[i]['name'],
        email: maps[i]['email'],
        phone: maps[i]['phone'],
        userProfilePath: maps[i]['userProfilePath'],
      );
    });
  }

  Future<void> updateLoginUser(User user) async {
    final db = await DataBaseHelper.database();
    await db.update(
      tableGroupName3,
      user.toMap(),
      where: 'phone = ?',
      whereArgs: [user.name],
    );
  }
}
