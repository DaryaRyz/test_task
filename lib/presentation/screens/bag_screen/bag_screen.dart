import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/domain/bloc/bag_bloc.dart';
import 'package:test_task_flutter/presentation/screens/bag_screen/bag_item_widget.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/ui_util.dart';
import 'package:test_task_flutter/presentation/widgets/app_loader.dart';
import 'package:test_task_flutter/presentation/widgets/app_snack_bar.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_text_button.dart';
import 'package:test_task_flutter/presentation/widgets/custom_app_bar.dart';
import 'package:test_task_flutter/presentation/widgets/empty_body.dart';

@RoutePage()
class BagScreen extends StatefulWidget {
  const BagScreen({Key? key}) : super(key: key);

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final _bagBloc = GetIt.I<BagBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.backgroundColor,
      appBar: const CustomAppBar(),
      body: BlocConsumer(
        bloc: _bagBloc,
        listener: (context, state) {
          if (state is BagErrorState) {
            AppSnackBar.show(context, text: state.errorText);
          }
        },
        buildWhen: (context, state) => state is! BagErrorState,
        builder: (context, state) {
          if (state is BagLoadingState) {
            return const AppLoader();
          } else if (state is BagReadyState) {
            if (state.items.isNotEmpty) {
              return Stack(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) => BagItemWidget(
                      item: state.items[index],
                      onAdd: () => _bagBloc.add(AddProductEvent(state.items[index])),
                      onReduce: () => _bagBloc.add(ReduceProductEvent(state.items[index])),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: AppTextButton(
                        title: UiUtil.getTotalPrice(state.totalPrice),
                        onTap: () {
                          //TODO: implement the payment function
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          return EmptyBody(
            text: 'emptyBag'.tr(),
          );
        },
      ),
    );
  }
}
