import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/data/dto/bag_item_dto.dart';
import 'package:test_task_flutter/data/storage/bag_storage.dart';
import 'package:test_task_flutter/domain/models/bag_item.dart';
import 'package:test_task_flutter/domain/repository/i_bag_repository.dart';

@Injectable(as: IBagRepository)
class BagRepository implements IBagRepository {
  final BagStorage _storage;

  BagRepository(this._storage);

  @override
  Future<List<BagItem>> getBagItems() async {
    final response = await _storage.loadBagItems();
    final dtoModels = response?.map((e) => BagItemDto.fromMap(e)).toList() ?? [];
    return dtoModels.map((e) => BagItemDto.toModel(e)).toList();
  }

  @override
  Future<void> saveBagItems(List<BagItem> items) async {
    final dtoModels = items.map((e) => BagItemDto.fromModel(e)).toList();
    await _storage.saveBagItems(dtoModels.map((e) => e.toMap()).toList());
  }
}
