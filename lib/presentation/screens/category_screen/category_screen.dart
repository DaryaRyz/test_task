import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/domain/bloc/dishes_bloc.dart';
import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/widgets/category_content.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';
import 'package:test_task_flutter/presentation/widgets/custom_app_bar.dart';
import 'package:test_task_flutter/presentation/widgets/error_body.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _dishesBloc = GetIt.I<DishesBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: CustomAppBar(
        type: AppBarType.classic,
        title: widget.category.name ?? 'catalog'.tr(),
      ),
      body: BlocBuilder(
        bloc: _dishesBloc,
        builder: (context, state) {
          if (state is DishesReadyState) {
            return CategoryContent(
              data: state.data,
              bloc: _dishesBloc,
            );
          } else if (state is DishesLoadingState) {
            return const AppLoader();
          } else if (state is DishesErrorState) {
            return ErrorBody(
              errorText: state.errorText,
              onTap: () => _dishesBloc.add(GetDishesEvent()),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
