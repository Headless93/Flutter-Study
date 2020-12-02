import 'package:flutter/material.dart';
import 'color.dart';

//产品字体
class ProductFonts {

  static TextStyle itemNameStype = TextStyle(
    fontSize: 12.0,
    color: Color(0xFF999999),
  );
  static TextStyle itemProductStyle= TextStyle(
  color: MbColors.color_8f92b8,
  fontSize: 14,
  );

  static TextStyle itemTitleStype = TextStyle(
    fontSize: 15.0,
    color: MbColors.color_999,
  );
  static TextStyle itemValueStyle= TextStyle(
    color: MbColors.color_333,
    fontSize: 15,
  );

  static TextStyle useTitleStype = TextStyle(
    fontSize: 15.0,
    color: MbColors.color_333,
    fontWeight: FontWeight.bold,
  );

  static TextStyle casStreamStyle= TextStyle(
    color: MbColors.color_3f6bdc,
    fontSize: 12,
  );
  static TextStyle nameStreamStyle= TextStyle(
    color: MbColors.color_999,
    fontSize: 10,
  );
  static TextStyle routeTitleStyle= TextStyle(
    color: MbColors.color_1d1d1d,
    fontSize: 13,
  );
  static TextStyle routeRateStyle= TextStyle(
    color: MbColors.color_ff771c,
    fontSize: 12,
  );
}