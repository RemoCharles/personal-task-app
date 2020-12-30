import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const _textSizeTitle = 25.0;
  static const _textSizeLowerTitle = 20.0;
  static const _textSizeText = 15.0;
  static const _textWeightTitle = FontWeight.w700;
  static const _textWeightLowerTitle = FontWeight.w600;
  static const _textWeightText = FontWeight.w400;

  static final textTitle = GoogleFonts.nunito(
      fontSize: _textSizeTitle, fontWeight: _textWeightTitle);

  static final textLowerTitle = GoogleFonts.nunito(
      fontSize: _textSizeLowerTitle, fontWeight: _textWeightLowerTitle);

  static final textText =
      GoogleFonts.nunito(fontSize: _textSizeText, fontWeight: _textWeightText);
}
