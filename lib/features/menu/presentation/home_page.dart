import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 30.h,
                decoration: BoxDecoration(color: AppColors.uprmGreen),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: topRow(),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 70.h,
                decoration: BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget topRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: uprmButton(),
      ),
      CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 24.sp,
          color: AppColors.white,
        ),
      ),
    ],
  );
}

Widget uprmButton() {
  return Row(
    children: [
      Text(
        "UPRM",
        style: TextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w600,
        ),
      ),
      Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.white),
    ],
  );
}
