import 'package:hive_flutter/adapters.dart';

abstract class HiveBaseRepository<T> {
  String get boxName => T.toString().toLowerCase();
  String get key => 'key_$boxName';

  Box<T>? _box;

  Future<void> _initBox() async {
    _box = await Hive.openBox(boxName);
  }

  Future<Box<T>> get baseBox async {
    final boxOpened = _box?.isOpen ?? false;
    if (!boxOpened) await _initBox();
    return _box!;
  }
}
