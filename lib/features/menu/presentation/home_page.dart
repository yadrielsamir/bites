import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_shadows.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      top: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 40.h, color: AppColors.uprmGreen),

                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    width: double.infinity,
                    height: 70.h + 20,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          offset: const Offset(0, -2),
                          color: Colors.black.withValues(alpha: 0.06),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          optionsText(),
                          foodCard(
                            'Batatas Potatoes',
                            'Edf. Ernesto Martinez Nadal',
                            '6:00pm',
                          ),
                          SizedBox(height: 2.h),
                          foodCard(
                            'Shawarma Food Truck',
                            'Edf. Ingeniería Civil',
                            '5:00pm',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
            ).copyWith(top: MediaQuery.of(context).padding.top + 2),
            child: topRow(),
          ),
        ],
      ),
    );
  }

  Widget topRow() {
    return Column(
      children: [
        Row(
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
                size: 20.sp,
                color: AppColors.white,
              ),
            ),
          ],
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

  Widget optionsText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Text(
        'Explore your options',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget foodCard(String title, String location, String closingTime) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('ordering_options');
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.uprmGreen),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 14.h,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.xs,
                vertical: 1.5.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      height: 1.0,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.storefront_outlined,
                        size: 18.sp,
                        color: AppColors.uprmGreen,
                      ),
                      Text(
                        'Open.',
                        style: TextStyle(
                          color: AppColors.uprmGreen,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        'Closes: $closingTime',
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
