import 'package:bites/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bites/features/orders/domain/models/category.dart';

Future<int?> showMenuCategoriesModal(
  BuildContext context, {
  required List<Category> categories,
  int selectedIndex = 0,
}) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (_) => MenuCategoriesSheet(
      categories: categories,
      selectedIndex: selectedIndex,
    ),
  );
}

class MenuCategoriesSheet extends StatelessWidget {
  const MenuCategoriesSheet({
    super.key,
    required this.categories,
    required this.selectedIndex,
  });

  final List<Category> categories;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Align at the bottom
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 8),
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Select category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final c = categories[i];
                final selected = i == selectedIndex;
                return ListTile(
                  onTap: () => Navigator.of(context).pop(i),
                  title: Text('${c.name} (${c.count} items)'),
                  trailing: selected
                      ? Icon(Icons.check, color: AppColors.uprmGreen)
                      : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  minVerticalPadding: 14,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
