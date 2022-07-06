import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/alarm_history.dart';
import 'package:alarm_app/models/barcode_qrcode.dart';
import 'package:alarm_app/models/photo.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/models/setting.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManagement {
  late Database database;

  Future<Database> initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'alarmManagement.db'),
      onCreate: (database, verison) async {
        String script =
            await rootBundle.loadString('assets\\sql\\my_alarm.sql');
        List<String> commands = script.split(';');
        for (var command in commands) {
          if (command.isNotEmpty) {
            database.execute(command.trim());
          }
        }
      },
      version: 1,
    );
  }

  // insertAlarm, getAlarms, updateAlarm, deleteAlarm
  Future<void> insertAlarm(Alarm alarm) async {
    final Database db = await initDB();
    db.insert('alarm', alarm.toMap());
  }

  Future<List<Alarm>> getAlarms() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('alarm');
    return datas.map((e) => Alarm.fromMap(e)).toList();
  }

  Future<void> updateAlarm(Alarm alarm, int id) async {
    final Database db = await initDB();
    await db
        .update("alarm", alarm.toMap(), where: "alarmId=?", whereArgs: [id]);
  }

  Future<void> deleteAlarm(int id) async {
    final Database db = await initDB();
    await db.delete("alarm", where: "alarmId=?", whereArgs: [id]);
  }

  // insertAlarmHistory, getAlarmHistory, deleteAlarmHistory
  Future<void> insertAlarmHistory(AlarmHistory alarmHistory) async {
    final Database db = await initDB();
    db.insert('alarmHistory', alarmHistory.toMap());
  }

  Future<List<AlarmHistory>> getAlarmHistory() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('alarmHistory');
    return datas.map((e) => AlarmHistory.fromMap(e)).toList();
  }

  Future<void> deleteAlarmHistory(int id) async {
    final Database db = await initDB();
    await db.delete("alarmHistory", where: "alarmHistoryId=?", whereArgs: [id]);
  }

  // insertRingtone, getRingtones, deleteRingtone
  Future<void> insertRingtone(Ringtone ringtone) async {
    final Database db = await initDB();
    db.insert('ringtone', ringtone.toMap());
  }

  Future<List<Ringtone>> getRingtones() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('ringtone');
    return datas.map((e) => Ringtone.fromMap(e)).toList();
  }

  Future<void> deleteRingtone(int id) async {
    final Database db = await initDB();
    await db.delete("ringtone", where: "ringtoneId=?", whereArgs: [id]);
  }

  // insertSetting, updateSetting, getSetting
  Future<void> insertSetting(BarcodeQRcode barcodeQRcode) async {
    final Database db = await initDB();
    db.insert('barcodeQRcode', barcodeQRcode.toMap());
  }

  Future<List<BarcodeQRcode>> getSetting() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('barcodeQRcode');
    return datas.map((e) => BarcodeQRcode.fromMap(e)).toList();
  }

  Future<void> update(Setting setting, int id) async {
    final Database db = await initDB();
    await db.update("setting", setting.toMap(),
        where: "settingId=?", whereArgs: [id]);
  }

  // insertPhoto, getPhotos, deletePhoto
  Future<void> insertPhoto(Photo photo) async {
    final Database db = await initDB();
    db.insert('photo', photo.toMap());
  }

  Future<List<Photo>> getPhotos() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('photo');
    return datas.map((e) => Photo.fromMap(e)).toList();
  }

  Future<void> deletePhoto(int id) async {
    final Database db = await initDB();
    await db.delete("photo", where: "photoId=?", whereArgs: [id]);
  }

  // insertBarcodeQRcode, getBarcodeQRcode, deleteBarcodeQRcode
  Future<void> insertBarcodeQRcode(BarcodeQRcode barcodeQRcode) async {
    final Database db = await initDB();
    db.insert('barcodeQRcode', barcodeQRcode.toMap());
  }

  Future<List<BarcodeQRcode>> getBarcodeQRcode() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> datas = await db.query('barcodeQRcode');
    return datas.map((e) => BarcodeQRcode.fromMap(e)).toList();
  }

  Future<void> deleteBarcodeQRcode(int id) async {
    final Database db = await initDB();
    await db
        .delete("barcodeQRcode", where: "barcodeQRcodeId=?", whereArgs: [id]);
  }
}
