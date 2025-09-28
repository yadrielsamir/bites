import 'package:bites/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomArcContainer extends StatelessWidget {
  final Color color;
  final double height;

  const BottomArcContainer({
    super.key,
    this.color = AppColors.uprmGreen,
    this.height = 23,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomArcClipper(),
      child: Container(height: height.h, color: color),
    );
  }
}

class BottomArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 70,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
