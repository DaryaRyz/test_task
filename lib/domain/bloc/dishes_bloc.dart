import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_task_flutter/data/services/api_exceptions.dart';
import 'package:test_task_flutter/domain/config/constants.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/domain/models/dishes_category_data.dart';
import 'package:test_task_flutter/domain/repository/i_products_repository.dart';

@injectable
class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final IProductsRepository repository;

  DishesBloc(this.repository) : super(DishesLoadingState()) {
    on<GetDishesEvent>(_getMealsHandler);
    on<ChangeDishesFilterEvent>(_changeFilterHandler);
    add(GetDishesEvent());
  }

  List<Dish> _dishes = [];
  List<String> _tags = Constants.defaultDishesTags;
  late String _selectedTag = _tags[0];

  FutureOr<void> _getMealsHandler(GetDishesEvent event, emit) async {
    emit(DishesLoadingState());
    try {
      _dishes = await repository.getMeals();
      _tags = _getTags(_dishes, _tags);
      emit(
        DishesReadyState(
          DishesCategoryData(
            dishes: _dishes,
            tags: _tags,
            selectedTag: _selectedTag,
          ),
        ),
      );
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

  FutureOr<void> _changeFilterHandler(ChangeDishesFilterEvent event, emit) {
    _selectedTag = event.selectedTag;

    final filteredDishes = _dishes.where((element) => element.tags.contains(_selectedTag)).toList();
    emit(
      DishesReadyState(
        DishesCategoryData(
          dishes: filteredDishes,
          tags: _tags,
          selectedTag: _selectedTag,
        ),
      ),
    );
  }

  ///We don't have an API method to get the tags in the right sequence, so we add all the
  ///tags from the list of dishes to the finished tag sequence (according to the design)
  ///and remove the duplicates
  List<String> _getTags(List<Dish> dishes, List<String> tags) {
    dishes.map((e) => tags.addAll(e.tags));
    return tags.toSet().toList();
  }
}

abstract class DishesEvent {}

class GetDishesEvent extends DishesEvent {}

class ChangeDishesFilterEvent extends DishesEvent {
  final String selectedTag;

  ChangeDishesFilterEvent(this.selectedTag);
}

abstract class DishesState {}

class DishesLoadingState extends DishesState {}

class DishesReadyState extends DishesState {
  final DishesCategoryData data;

  DishesReadyState(this.data);
}

class DishesErrorState extends DishesState {
  final String errorText;

  DishesErrorState(this.errorText);
}
