import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topRow(),
              SizedBox(height: 4.h),
              Text('Location', style: TextStyle(fontSize: 16.sp)),
              _tile('UPRM', Icons.location_on_outlined, single: true),
              SizedBox(height: 2.h),
              Text('Account', style: TextStyle(fontSize: 16.sp)),
              _tile('Personal Info', Icons.person_outline),
              _tile('Account Settings', Icons.settings_outlined),
              _tile('Privacy', Icons.info_outline),
              Divider(),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.uprmGreen,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
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
          'Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _tile(String title, IconData icon, {bool single = false}) {
    return Column(
      children: [
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.darkGrey),
                SizedBox(width: 2.w),
                Text(title),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.darkGrey,
              size: 16.sp,
            ),
          ],
        ),
        if (single) Divider(),
      ],
    );
  }
}
