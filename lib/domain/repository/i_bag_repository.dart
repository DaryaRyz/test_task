import 'package:test_task_flutter/domain/models/bag_item.dart';

abstract class IBagRepository {
  Future<List<BagItem>> getBagItems();

  Future<void> saveBagItems(List<BagItem> items);
}
