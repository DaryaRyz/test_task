import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_task_flutter/data/services/api_exceptions.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/domain/repository/i_products_repository.dart';

@injectable
class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final IProductsRepository repository;

  DishesBloc(this.repository) : super(DishesLoadingState()) {
    on<GetDishesEvent>(_getMealsHandler);
    on<ChangeDishesFilterEvent>(_changeFilterHandler);
    add(GetDishesEvent());
  }

  FutureOr<void> _getMealsHandler(GetDishesEvent event, Emitter<DishesState> emit) async {
    emit(DishesLoadingState());
    try {
      final response = await repository.getMeals();
      emit(DishesReadyState(response));
    } catch (e) {
      String errorText = 'apiError'.tr();

      if (e is ApiException) {
        errorText = e.errorText;
        Logger().e('ApiException: ${e.body}');
      } else {
        Logger().e(e.toString());
      }
      emit(DishesErrorState(errorText));
    }
  }

  FutureOr<void> _changeFilterHandler(ChangeDishesFilterEvent event, Emitter<DishesState> emit) {}
}

abstract class DishesEvent {}

class GetDishesEvent extends DishesEvent {}

class ChangeDishesFilterEvent extends DishesEvent {}

abstract class DishesState {}

class DishesLoadingState extends DishesState {}

class DishesReadyState extends DishesState {
  final List<Dish> meals;

  DishesReadyState(this.meals);
}

class DishesErrorState extends DishesState {
  final String errorText;

  DishesErrorState(this.errorText);
}
