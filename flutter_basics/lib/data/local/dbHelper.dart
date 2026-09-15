import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  // singleton class
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  static final TABLE_NAME = 'notes';
  static final COLUMN_S_NO = 's_no';
  static final COLUMN_TITLE = 'title';
  static final COLUMN_DESCRIPTION = 'description';

  Database? myDB;

  Future<Database> getDB() async {
    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
    myDB = myDB ?? await openDB();
    return myDB!;
  }

  Future<Database> openDB() async {
    Directory appPath = await getApplicationDocumentsDirectory();
    String dbPath = join(appPath.path, "notes.db");
    print(appPath);

    return await openDatabase(
      dbPath,
      onCreate: (db, version) => {
        db.execute(
          'create table $TABLE_NAME ($COLUMN_S_NO integer primary key autoincrement, $COLUMN_TITLE text, $COLUMN_DESCRIPTION text)',
        ),
      },
      version: 1,
    );
  }

  Future<bool> addNotes({
    required String title,
    required String description,
  }) async {
    var db = await getDB();
    int rowsAffected = await db.insert(TABLE_NAME, {
      COLUMN_TITLE: title,
      COLUMN_DESCRIPTION: description,
    });
    return rowsAffected > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> myData = await db.query(TABLE_NAME);
    return myData;
  }

  Future<bool> deleteNote({required int id}) async {
    var db = await getDB();
    int row = await db.delete(TABLE_NAME, where: 's_no = ?', whereArgs: [id]);
    return row > 0;
  }

  Future<bool> updateNote({
    required int id,
    required String title,
    required String description,
  }) async {
    var db = await getDB();

    int row = await db.update(TABLE_NAME, {
      COLUMN_TITLE: title,
      COLUMN_DESCRIPTION: description,
    }, where: "$COLUMN_S_NO = $id");
    return row > 0;
  }
}
