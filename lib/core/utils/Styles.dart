import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constant.dart';

abstract class Styles {
  static var textstyle20 = TextStyle(
      fontSize: 19.75.sp, color: kWhiteColor, fontWeight: FontWeight.w600);
  static var textstyle11 = TextStyle(
      fontSize: 11.sp, color: kWhiteColor, fontWeight: FontWeight.w300);
  static var textstyle11Pink = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 11.sp, color: HexColor('#FFDCBC'));
  static var textstyle14 = GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w600);
  static var textstyle12 = GoogleFonts.poppins().copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static var textstyle10 = GoogleFonts.poppins().copyWith(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.grey);


}
