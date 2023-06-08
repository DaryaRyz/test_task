import 'package:auto_route/auto_route.dart';
import 'package:test_task_flutter/internal/home_page.dart';
import 'package:test_task_flutter/presentation/screens/bag_screen/bag_screen.dart';
import 'package:test_task_flutter/presentation/screens/category_screen/category_screen.dart';
import 'package:test_task_flutter/presentation/screens/main_screen/main_screen.dart';
import 'package:test_task_flutter/presentation/screens/profile_screen/profile_screen.dart';
import 'package:test_task_flutter/presentation/screens/search_screen/search_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          initial: true,
          page: HomePageRoute.page,
          children: [
            AutoRoute(
              path: 'main',
              page: MainRouter.page,
              children: [
                AutoRoute(path: '', page: MainScreenRoute.page),
                CustomRoute(
                  path: 'category',
                  page: CategoryScreenRoute.page,
                  transitionsBuilder: TransitionsBuilders.slideLeft,
                ),
              ],
            ),
            AutoRoute(path: 'search', page: SearchScreenRoute.page),
            AutoRoute(path: 'bag', page: BagScreenRoute.page),
            AutoRoute(path: 'profile', page: ProfileScreenRoute.page),
          ],
        ),
      ];
}

@RoutePage(name: 'MainRouter')
class MainRouterPage extends AutoRouter {
  const MainRouterPage({super.key});
}
