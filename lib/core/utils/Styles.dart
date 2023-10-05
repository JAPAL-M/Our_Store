import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

abstract class Styles {
  static var textstyle20 = TextStyle(
      fontSize: 19.75.sp, color: kWhiteColor, fontWeight: FontWeight.w600);
  static var textstyle11 = TextStyle(fontSize: 11.sp, color: kWhiteColor, fontWeight: FontWeight.w300);
  //static var textstyle11Pink = TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp, color: HexColor('#FFDCBC'));
  static var textstyle14 = GoogleFonts.poppins().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600);
 // static var textstyle14w300 = TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w300);
  static var textstyle12 = GoogleFonts.poppins().copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);
  static var textstyle10 = GoogleFonts.poppins().copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400, color: Colors.grey);
//  static var textstyle10black = TextStyle(fontSize: 10.sp,fontWeight: FontWeight.w300);
  static var textstyle24 = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600, color: kSecondaryColor);
 // static const textstyle24w400 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  static var textstyle19 = TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500);
  static var textstyle50 = TextStyle(fontSize: 40.sp,color: Colors.white);
  static var textstyle17 = TextStyle(fontSize: 17.sp);

}
