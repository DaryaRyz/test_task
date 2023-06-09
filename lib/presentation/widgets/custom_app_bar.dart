import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/domain/bloc/geolocator_cubit.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/styles/ui_util.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';
import 'package:test_task_flutter/presentation/widgets/app_snack_bar.dart';

enum AppBarType { location, classic }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final AppBarType type;

  const CustomAppBar({
    Key? key,
    this.title,
    this.type = AppBarType.location,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AppBar(
        backgroundColor: ColorStyles.backgroundColor,
        elevation: 0,
        centerTitle: type == AppBarType.classic,
        leading: _getLeading(type, onBack: () => Navigator.pop(context)),
        title: _getTitle(type),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: Image.asset(Assets.images.avatar.path).image,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTitle(AppBarType type) {
    switch (type) {
      case AppBarType.location:
        return const _LocationTitle();
      case AppBarType.classic:
        return Text(
          title ?? 'Title unknown',
          style: TextStyles.h2,
        );
    }
  }

  Widget? _getLeading(AppBarType type, {required VoidCallback onBack}) {
    switch (type) {
      case AppBarType.location:
        return null;
      case AppBarType.classic:
        return TextButton(
          onPressed: onBack,
          child: Assets.icons.back.svg(),
        );
    }
  }
}

class _LocationTitle extends StatefulWidget {
  const _LocationTitle({Key? key}) : super(key: key);

  @override
  State<_LocationTitle> createState() => _LocationTitleState();
}

class _LocationTitleState extends State<_LocationTitle> {
  final _geoLocatorCubit = GetIt.I<GeoLocatorCubit>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Assets.icons.location.svg(),
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer(
              bloc: _geoLocatorCubit,
              listener: (context, state) {
                if (state is GeoLocatorErrorState) {
                  AppSnackBar.show(context, text: state.errorText);
                }
              },
              builder: (context, state) {
                if (state is GeoLocatorReadyState) {
                  return Text(
                    state.city,
                    style: TextStyles.h2,
                  );
                } else if (state is GeoLocatorLoadingState) {
                  return const AppLoader();
                }
                return Text(
                  'unknown'.tr(),
                  style: TextStyles.h2,
                );
              },
            ),
            const SizedBox(height: 4),
            Text(
              UiUtil.dateFormat(DateTime.now()),
              style: TextStyles.h4,
            ),
          ],
        ),
      ],
    );
  }
}
