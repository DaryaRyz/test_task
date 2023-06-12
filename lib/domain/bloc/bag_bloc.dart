import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_task_flutter/data/services/api_exceptions.dart';
import 'package:test_task_flutter/domain/models/bag_item.dart';
import 'package:test_task_flutter/domain/repository/i_bag_repository.dart';

@singleton
class BagBloc extends Bloc<BagEvent, BagState> {
  final IBagRepository _repository;

  BagBloc(this._repository) : super(BagLoadingState()) {
    on<AddProductEvent>(_addHandler);
    on<ReduceProductEvent>(_reduceHandler);
    on<_GetBagItemsEvent>(_getItemsHandler);
    add(_GetBagItemsEvent());
  }

  List<BagItem> _items = [];

  FutureOr<void> _addHandler(AddProductEvent event, emit) async {
    try {
      if (_items.contains(event.item)) {
        final index = _items.indexWhere((element) => element == event.item);
        _items[index] = _items[index].copyWith(count: _items[index].count + 1);
      } else {
        _items.add(event.item);
      }
      await _repository.saveBagItems(_items);
      emit(BagReadyState(_items, _getTotalPrice(_items)));
    } catch (e) {
      emit(BagErrorState(_errorTextHandler(e)));
    }
  }

  FutureOr<void> _reduceHandler(ReduceProductEvent event, emit) async {
    try {
      if (event.item.count <= 1) {
        _items.remove(event.item);
      } else {
        final index = _items.indexWhere((element) => element == event.item);
        _items[index] = _items[index].copyWith(count: _items[index].count - 1);
      }
      await _repository.saveBagItems(_items);
      emit(BagReadyState(_items, _getTotalPrice(_items)));
    } catch (e) {
      emit(BagErrorState(_errorTextHandler(e)));
    }
  }

  FutureOr<void> _getItemsHandler(_GetBagItemsEvent event, emit) async {
    emit(BagLoadingState());
    try {
      _items = await _repository.getBagItems();
      emit(BagReadyState(_items, _getTotalPrice(_items)));
    } catch (e) {
      emit(BagErrorState(_errorTextHandler(e)));
    }
  }

  double _getTotalPrice(List<BagItem> items) {
    double totalPrice = 0;
    for (var element in items) {
      totalPrice += element.count * (element.dish.price ?? 0);
    }
    return totalPrice;
  }

  String _errorTextHandler(Object e) {
    if (e is ApiException) {
      Logger().e(e.errorText);
      return e.errorText;
    }

    Logger().e(e.toString());
    return 'defaultError'.tr();
  }
}

abstract class BagEvent {}

class AddProductEvent extends BagEvent {
  final BagItem item;

  AddProductEvent(this.item);
}

class ReduceProductEvent extends BagEvent {
  final BagItem item;

  ReduceProductEvent(this.item);
}

class _GetBagItemsEvent extends BagEvent {}

abstract class BagState {}

class BagLoadingState extends BagState {}

class BagReadyState extends BagState {
  final List<BagItem> items;
  final double totalPrice;

  BagReadyState(this.items, this.totalPrice);
}

class BagErrorState extends BagState {
  final String errorText;

  BagErrorState(this.errorText);
}
