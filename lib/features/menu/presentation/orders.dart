import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool showActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Column(
            children: [
              _topRow(),
              SizedBox(height: 4.h),
              _switchContainer(),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'October 2025',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),

              _buildOrderCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
            color: AppColors.black,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 20.sp,
            color: AppColors.uprmGreen,
          ),
        ),
      ],
    );
  }

  Widget _switchContainer() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSwitchButton(
              label: 'Active Orders',
              isSelected: showActive,
              onTap: () => setState(() => showActive = true),
              isLeft: true,
            ),
            _buildSwitchButton(
              label: 'Past Orders',
              isSelected: !showActive,
              onTap: () => setState(() => showActive = false),
              isLeft: false,
            ),
          ],
        );
      },
    );
  }

  Widget _buildSwitchButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isLeft,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mint : AppColors.backgroundWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLeft ? 30.sp : 0),
            bottomLeft: Radius.circular(isLeft ? 30.sp : 0),
            topRight: Radius.circular(!isLeft ? 30.sp : 0),
            bottomRight: Radius.circular(!isLeft ? 30.sp : 0),
          ),
          border: Border(
            left: BorderSide(color: AppColors.uprmGreen, width: 0.4.w),
            top: BorderSide(color: AppColors.uprmGreen, width: 0.4.w),
            bottom: BorderSide(color: AppColors.uprmGreen, width: 0.4.w),
            right: isLeft
                ? BorderSide.none
                : BorderSide(color: AppColors.uprmGreen, width: 0.4.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: AppColors.uprmGreen, width: 0.4.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: 1.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Batatas Potatoes',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    '12:01 PM',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
              Text(
                'Order Details:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.darkGrey,
                ),
              ),
              // Main bullet
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(fontSize: 16.sp)),
                  Expanded(
                    child: Text(
                      'Batata “LA FAVORITA”',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _subBullet('ADD Chicken'),
                    _subBullet('ADD Cheese'),
                    _subBullet('REMOVE Bacon'),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('• ', style: TextStyle(fontSize: 16.sp)),
                  Expanded(
                    child: Text(
                      'Sprite 12oz',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.uprmGreen),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(
                          color: AppColors.uprmGreen,
                          width: 0.4.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Row(
                          children: [
                            Icon(Icons.cancel_outlined, color: AppColors.black),
                            SizedBox(width: 2.w),
                            Text(
                              'Cancel Order',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mint,
                        borderRadius: BorderRadius.circular(14.sp),
                        border: Border.all(
                          color: AppColors.uprmGreen,
                          width: 0.4.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Row(
                          children: [
                            Text(
                              'Total: \$12.30',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            Icon(Icons.arrow_forward, color: AppColors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _subBullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• ', style: TextStyle(fontSize: 14.sp)),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
