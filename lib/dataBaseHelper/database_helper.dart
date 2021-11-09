import 'package:flutter/material.dart';
import 'package:pinshow_pro/model/groups_data.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static const String databaseName = 'userGroups.db';
  static const String tableName = 'table_user_groups';
  static const String cId = 'id';
  static const String cToken = 'token';
  static const String cInviteCode = 'inviteCode';
  static const String cName = 'name';
  static const String cPrivateStatus = 'privateStatus';
  static const String cGroupDefault = "cGroupDefault";
  static const dynamic cGeneratedCodeTime = 'generatedCodeTime';
  static const String cExpiredCodeTime = 'expiredCodeTime';
  static const String cCreatedAt = 'createdAt';
  static const String cUpdatedAt = 'updatedAt';
  static const String cUserId = 'userId';
  static const String cGroupId = 'groupId';
  static const int version = 1;

  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    debugPrint("database path is: $dbPath");
    return await sql.openDatabase(path.join(dbPath, databaseName),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $tableName('
          ' $cId INTEGER PRIMARY KEY,'
          ' $cToken TEXT,'
          ' $cInviteCode TEXT,'
          ' $cName TEXT,'
          ' $cPrivateStatus TEXT,'
          ' $cGroupDefault TEXT,'
          ' $cGeneratedCodeTime TEXT,'
          ' $cExpiredCodeTime TEXT,'
          ' $cCreatedAt TEXT,'
          ' $cUpdatedAt TEXT,'
          ' $cUserId TEXT,'
          ' $cGroupId TEXT)');
    }, version: version);
  }

  //چرا؟ برای وارد کردن و ذخیره کردن یوزر
  //  پارامتر های ورودی مپ دیتا و مپ تیبل
  Future<void> insertGroupUser(Map<String, dynamic> data) async {
    final db = await DataBaseHelper.database();
    db.insert(
      tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<Data>> retrieveGroups() async {
    final db =  await DataBaseHelper.database();
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return Data(
        token: maps[i]['token'],
        groups: maps[i]['groups'],
      );
    });
  }


  Future<void> updateUserGroups(Data data) async {
    final db =  await DataBaseHelper.database();
    await db.update(
      tableName,
      data.toMap(),
      where: 'token = ?',
      whereArgs: [data.token],
    );
  }
}
