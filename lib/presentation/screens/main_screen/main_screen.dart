import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/domain/bloc/category_cubit.dart';
import 'package:test_task_flutter/internal/routing/app_router.dart';
import 'package:test_task_flutter/presentation/screens/main_screen/widgets/category_card.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';
import 'package:test_task_flutter/presentation/widgets/custom_app_bar.dart';
import 'package:test_task_flutter/presentation/widgets/empty_body.dart';
import 'package:test_task_flutter/presentation/widgets/error_body.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _categoryCubit = GetIt.I<CategoryCubit>();

  @override
  void dispose() {
    _categoryCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: ColorStyles.backgroundColor,
      body: BlocBuilder(
        bloc: _categoryCubit,
        builder: (context, state) {
          if (state is CategoryReadyState) {
            if (state.categories.isEmpty) {
              return EmptyBody(text: 'emptyCategories'.tr());
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: state.categories.length,
              itemBuilder: (context, index) => CategoryCard(
                category: state.categories[index],
                onTap: () => GetIt.I<AppRouter>().push(
                  CategoryScreenRoute(category: state.categories[index]),
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            );
          } else if (state is CategoryLoadingState) {
            return const AppLoader();
          } else if (state is CategoryErrorState) {
            return ErrorBody(
              errorText: state.errorText,
              onTap: () => _categoryCubit.getCategories(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
