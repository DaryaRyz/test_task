import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class BagStorage {
  Box? _storage;

  BagStorage() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    _storage = await Hive.openBox('v1.0');
  }

  Future<void> saveBagItems(List<Map<String, dynamic>> items) async {
    _storage ?? await _init();
    await _storage!.delete('bag');
    await _storage!.put('bag', items);
  }

  Future<List?> loadBagItems() async {
    _storage ?? await _init();
    return _storage!.get('bag');
  }
}
