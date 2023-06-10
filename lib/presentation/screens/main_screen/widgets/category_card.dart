import 'package:flutter/material.dart';
import 'package:test_task_flutter/domain/models/category.dart';
import 'package:test_task_flutter/presentation/styles/text_styles.dart';
import 'package:test_task_flutter/presentation/widgets/image_preview.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ImagePreview(imageUrl: category.imageUrl),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: (MediaQuery.of(context).size.width - 64) / 2),
                child: Text(
                  category.name!,
                  style: TextStyles.h1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
