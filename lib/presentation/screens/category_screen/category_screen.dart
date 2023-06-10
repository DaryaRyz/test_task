import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        type: AppBarType.classic,
        title: 'FJNDKMJ<LG:',
      ),
      body: Center(child: Text('Category')),
    );
  }
}
