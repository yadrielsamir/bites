import 'package:flutter/material.dart';

class AppShadows {
  // Shadow for elevated buttons
  static const button = [
    BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 3)),
  ];

  // Shadow for text fields
  static const textField = [
    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
  ];

  // Shadow for cards or modals
  static const card = [
    BoxShadow(color: Colors.black26, blurRadius: 12, offset: Offset(0, 4)),
  ];
}
