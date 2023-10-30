import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LocalStorage {
  Future<void> save(String boxName, String key, dynamic value) async {
    var box = await Hive.openBox(boxName);

    await box.put(key, value);
    await box.close();
  }

  Future<dynamic> read(String boxName, String key) async {
    var box = await Hive.openBox(boxName);

    var result = box.get(key);

    await box.close();
    return result;
  }

  Future<void> delete(String boxName, String key) async {
    var box = await Hive.openBox(boxName);

    await box.delete(key);

    await box.close();
  }
}
