import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/internal/routing/app_router.dart';
import 'package:test_task_flutter/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GetIt.I<AppRouter>().push(const CategoryScreenRoute()),
      ),
      body: Container(
        width: double.maxFinite,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.red,
      ),
    );
  }
}
