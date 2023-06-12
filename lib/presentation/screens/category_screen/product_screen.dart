import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task_flutter/domain/bloc/bag_bloc.dart';
import 'package:test_task_flutter/domain/models/bag_item.dart';
import 'package:test_task_flutter/domain/models/dish.dart';
import 'package:test_task_flutter/presentation/styles/color_styles.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/styles/ui_util.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_counter_button.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_text_button.dart';
import 'package:test_task_flutter/presentation/widgets/image_with_background.dart';

class ProductScreen extends StatefulWidget {
  final Dish dish;

  const ProductScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _bagBloc = GetIt.I<BagBloc>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageWithBackground(widget.dish.imageUrl),
        const SizedBox(height: 8),
        Text(widget.dish.name ?? '', style: TextStyles.h3),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: UiUtil.priceParse(widget.dish.price), style: TextStyles.h4),
              TextSpan(
                text: ' · ${UiUtil.weightParse(widget.dish.weight)}',
                style: TextStyles.h4.copyWith(
                  color: ColorStyles.primaryFontColor.withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 4),
          child: SingleChildScrollView(
            child: Text(
              widget.dish.description ?? '',
              style: TextStyles.h3.copyWith(color: ColorStyles.primaryFontColor.withOpacity(0.65)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder(
          bloc: _bagBloc,
          builder: (context, state) {
            if (state is BagReadyState) {
              if (state.items.contains(BagItem(dish: widget.dish))) {
                final bagItem = state.items.firstWhere((e) => e.dish.id == widget.dish.id);
                return Center(
                  child: AppCounterButton(
                    width: MediaQuery.of(context).size.width - 64,
                    height: 48,
                    count: bagItem.count,
                    onAdd: () => _bagBloc.add(AddProductEvent(bagItem)),
                    onReduce: () => _bagBloc.add(ReduceProductEvent(bagItem)),
                  ),
                );
              }
            }
            return AppTextButton(
              title: 'addToBag'.tr(),
              onTap: () => _bagBloc.add(AddProductEvent(BagItem(dish: widget.dish))),
            );
          },
        ),
      ],
    );
  }
}
