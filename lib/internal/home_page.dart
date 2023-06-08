import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/internal/routing/app_router.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _labels = ['main'.tr(), 'search'.tr(), 'bag'.tr(), 'profile'.tr()];
  final _icons = [
    Assets.icons.navBar.home,
    Assets.icons.navBar.search,
    Assets.icons.navBar.bag,
    Assets.icons.navBar.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        MainScreenRoute(),
        SearchScreenRoute(),
        BagScreenRoute(),
        ProfileScreenRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          height: 68,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: ColorStyles.borderColor)),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            useLegacyColorScheme: false,
            selectedLabelStyle: TextStyles.h5.copyWith(color: ColorStyles.activeNavBarColor),
            unselectedLabelStyle: TextStyles.h5.copyWith(color: ColorStyles.inactiveNavBarColor),
            items: List.generate(
              _labels.length,
              (index) => BottomNavigationBarItem(
                label: _labels[index],
                activeIcon: _getIcon(_icons[index], true),
                icon: _getIcon(_icons[index], false),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getIcon(SvgGenImage icon, bool isActive) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: icon.svg(
        colorFilter: ColorFilter.mode(
          isActive ? ColorStyles.activeNavBarColor : ColorStyles.inactiveNavBarColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
