import 'package:bites/app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sizer/sizer.dart';

class MyTextField extends StatefulWidget {
  final String title;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool halfWidth;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  MyTextField({
    super.key,
    required this.title,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.halfWidth = false,
    this.controller,
    this.onChanged,
  });

  final MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscure = true;
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldTitle(widget.title),
        SizedBox(height: 0.8.h),
        _inputShell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _leadingIcon(widget.icon),
              SizedBox(width: 2.w),
              Expanded(child: _textFormField()),
              if (widget.isPassword) _passwordToggle(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _fieldTitle(String text) => Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),
  );

  Widget _inputShell(Widget child) => Container(
    height: 6.5.h,
    width: widget.halfWidth ? 42.w : null,
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: AppColors.uprmGreen, width: 1),
    ),
    child: child,
  );

  Widget _leadingIcon(IconData icon) =>
      Icon(icon, color: AppColors.hintTextColor, size: 20.sp);

  Widget _textFormField() {
    final isPhone = widget.isPhoneNumber;
    final formatter = isPhone ? [widget.phoneFormatter] : null;

    return TextFormField(
      controller: _controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      inputFormatters: formatter,
      maxLength: isPhone ? null : 35,
      obscureText: widget.isPassword ? _obscure : false,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        counterText: '',
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColors.hintTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget _passwordToggle() => CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () => setState(() => _obscure = !_obscure),
    child: Icon(
      _obscure ? Icons.visibility_off : Icons.visibility,
      color: AppColors.uprmGreen,
      size: 20.sp,
    ),
  );
}
