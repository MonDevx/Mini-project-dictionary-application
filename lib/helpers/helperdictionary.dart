import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:mini_project/models/eng2th_model.dart';
import 'package:mini_project/models/th2eng_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HelperDictionary {
  static Database _db;
  static Future<void> connectDB() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "lexitron.sqlite");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets/db", "lexitron.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    _db = await openDatabase(path, readOnly: true);
  }

  static void closedb() {
    _db.close();
  }

  static Future<List<Th2eng>> getAllWordsLikeTh(String text) async {
    var response = await _db
        .query("th2eng", where: "tsearch  LIKE ?", whereArgs: ['%$text'],
      limit: 5);
    List<Th2eng> list = response.map((c) => Th2eng.fromMap(c)).toList();
    return list;
  }

  static Future<Th2eng> getWordTh(String text) async {
    var response =
        await _db.query("th2eng", where: "tsearch  = ?", whereArgs: [text],
      limit: 5);
    List<Th2eng> list = response.map((c) => Th2eng.fromMap(c)).toList();
    return list.first;
  }

  static Future<List<Eng2th>> getAllWordsLikeEn(String text) async {
    var response = await _db.query("eng2th",
        where: "esearch  LIKE ?", whereArgs: ['%$text'], limit: 5);
    List<Eng2th> list = response.map((c) => Eng2th.fromMap(c)).toList();
    return list;
  }

  static Future<Eng2th> getWordEng(String text) async {
    var response = await _db.query("eng2th",
        where: "esearch  = ?", whereArgs: [text], limit: 5);
    List<Eng2th> list = response.map((c) => Eng2th.fromMap(c)).toList();
    return list.first;
  }
}
