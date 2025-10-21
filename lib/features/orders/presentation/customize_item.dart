import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class CustomizeItem extends StatefulWidget {
  final String item;
  final double price;

  const CustomizeItem({super.key, required this.item, required this.price});

  @override
  State<CustomizeItem> createState() => _CustomizeItemState();
}

class _CustomizeItemState extends State<CustomizeItem> {
  int count = 1;
  List<String> toppings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Text(widget.item, style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 2.h),
              _itemCount(),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Customize your order',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      _toppings(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCount() {
    return Container(
      height: 4.h,
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        border: Border.all(color: AppColors.uprmGreen),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            onPressed: () {
              if (count > 1) setState(() => count--);
            },
            padding: EdgeInsets.zero,
            child: Icon(Icons.remove, color: AppColors.uprmGreen, size: 20.sp),
          ),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 20.sp, color: AppColors.uprmGreen),
          ),
          CupertinoButton(
            onPressed: () => setState(() => count++),
            padding: EdgeInsets.zero,
            child: Icon(Icons.add, color: AppColors.uprmGreen, size: 20.sp),
          ),
        ],
      ),
    );
  }

  Widget _toppings() {
    return Row(
      children: [
        Text(
          'Add Toppings',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 2.w),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.sp),
            color: AppColors.lightGrey,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text('Optional', style: TextStyle(fontSize: 14.sp)),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundWhite,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: AppColors.uprmGreen, size: 20.sp),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info_outline,
            color: AppColors.uprmGreen,
            size: 20.sp,
          ),
        ),
      ],
    );
  }
}
