import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_task_flutter/data/services/api_exceptions.dart';
import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/domain/repository/i_products_repository.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final IProductsRepository repository;

  CategoryCubit(this.repository) : super(CategoryLoadingState()) {
    getCategories();
  }

  FutureOr<void> getCategories() async {
    emit(CategoryLoadingState());
    try {
      final response = await repository.getCategories();
      emit(CategoryReadyState(response));
    } catch (e) {
      String errorText = 'apiError'.tr();

      if (e is ApiException) {
        errorText = e.errorText;
        Logger().e('ApiException: ${e.body}');
      } else {
        Logger().e(e.toString());
      }
      emit(CategoryErrorState(errorText));
    }
  }
}

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryReadyState extends CategoryState {
  final List<Category> categories;

  CategoryReadyState(this.categories);
}

class CategoryErrorState extends CategoryState {
  final String errorText;

  CategoryErrorState(this.errorText);
}
