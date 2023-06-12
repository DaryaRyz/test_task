import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/domain/models/bag_item.dart';

@singleton
class BagBloc extends Bloc<BagEvent, BagState> {
  BagBloc() : super(BagLoadingState()) {
    on<AddProductEvent>(_addHandler);
    on<ReduceProductEvent>(_reduceHandler);
    on<_GetBagItemsEvent>(_getItemsHandler);
    add(_GetBagItemsEvent());
  }

  final List<BagItem> _items = [];

  FutureOr<void> _addHandler(AddProductEvent event, emit) {
    if (_items.contains(event.item)) {
      final index = _items.indexWhere((element) => element == event.item);
      _items[index] = _items[index].copyWith(count: _items[index].count + 1);
    } else {
      _items.add(event.item);
    }
    emit(BagReadyState(_items));
  }

  FutureOr<void> _reduceHandler(ReduceProductEvent event, emit) {
    if (event.item.count <= 1) {
      _items.remove(event.item);
    } else {
      final index = _items.indexWhere((element) => element == event.item);
      _items[index] = _items[index].copyWith(count: _items[index].count - 1);
    }

    emit(BagReadyState(_items));
  }

  FutureOr<void> _getItemsHandler(_GetBagItemsEvent event, emit) {
    emit(BagLoadingState());
    emit(BagReadyState(_items));
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

  BagReadyState(this.items);
}

class BagErrorState extends BagState {
  final String errorText;

  BagErrorState(this.errorText);
}
