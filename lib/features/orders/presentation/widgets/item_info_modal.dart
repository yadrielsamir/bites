import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemInfoModal extends StatelessWidget {
  final String item;
  final double price;
  final String description;
  final List<String> ingredients;

  const ItemInfoModal({
    super.key,
    required this.item,
    required this.price,
    required this.description,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.sm,
        AppSpacing.sm,
        AppSpacing.sm + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 1.2.h),
              height: 0.6.h,
              width: 12.w,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),

          Text(
            item,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 1.h),
          Text(description, style: TextStyle(fontSize: 16.sp)),

          if (ingredients.isNotEmpty) ...[
            SizedBox(height: 1.6.h),
            Text(
              'Base Ingredients',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 0.6.h),
            Wrap(
              spacing: 2.w,
              runSpacing: 0.8.h,
              children: ingredients
                  .map(
                    (i) => Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.2.w,
                        vertical: 0.6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(i, style: TextStyle(fontSize: 14.sp)),
                    ),
                  )
                  .toList(),
            ),
          ],

          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}
