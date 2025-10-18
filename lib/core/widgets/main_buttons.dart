import 'package:bites/app/theme/app_shadows.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;

  const MyButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.fillColor,
    required this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        height: 6.5.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: AppShadows.button,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
