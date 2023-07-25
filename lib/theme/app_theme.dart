import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomStyles on TextTheme {
  TextStyle get ballCaption =>  TextStyle(
    color: const Color.fromRGBO(114, 114, 114, 1),
    fontSize: 16.sp,
    fontWeight: FontWeight.w400
  );

  TextStyle get ballHeader =>  TextStyle(
    color: const Color.fromRGBO(114, 114, 114, 1),
    fontSize: 33.sp,
    fontWeight: FontWeight.w400
  );
}