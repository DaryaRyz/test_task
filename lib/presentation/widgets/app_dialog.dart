import 'package:flutter/material.dart';
import 'package:test_task_flutter/gen/assets.gen.dart';
import 'package:test_task_flutter/presentation/widgets/buttons/app_icon_button.dart';

class AppDialog {
  static void show(
    BuildContext context, {
    required Widget body,
    required List<Widget> actions,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (dialogContext) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                body,
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ...actions,
                      const SizedBox(width: 8),
                      AppIconButton(
                        icon: Assets.icons.close.svg(),
                        onTap: () => Navigator.pop(dialogContext),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
