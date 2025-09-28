import 'package:bites/app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatefulWidget {
  final String title;
  final String hint;
  final IconData icon;
  final bool isPassword;

  const MyTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldTitle(widget.title),
        SizedBox(height: 0.8.h),
        textField(widget.icon, widget.hint, widget.isPassword),
      ],
    );
  }

  Widget textField(IconData icon, String hint, bool isPassword) {
    return Container(
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.uprmGreen, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.hintTextColor, size: 20.sp),

          SizedBox(width: 2.w),

          Expanded(
            child: Center(
              child: TextField(
                maxLength: 35,
                obscureText: isPassword ? _obscure : false,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  counterText: '',
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.hintTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          if (isPassword)
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(
                _obscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.uprmGreen,
                size: 20.sp,
              ),
              onPressed: () {
                setState(() => _obscure = !_obscure);
              },
            ),
        ],
      ),
    );
  }
}

Widget fieldTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
  );
}
