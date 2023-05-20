import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? colorText;
  final String? fontFamily;
  final double? fontSize;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? heigth;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final double? letterSpacing;
  final Color? decorationColor;

  const TextWidget({
    required this.text,
    this.colorText,
    this.fontFamily,
    this.fontSize,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textOverflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.fontWeight,
    this.fontStyle,
    this.heigth,
    this.textDecoration,
    this.decorationThickness,
    this.letterSpacing,
    super.key,
    this.decorationColor,
  });

  factory TextWidget.poppins({
    required String text,
    final Color? colorText,
    final double? fontSize,
    final StrutStyle? strutStyle,
    final TextAlign? textAlign,
    final TextDirection? textDirection,
    final Locale? locale,
    final bool? softWrap,
    final TextOverflow? textOverflow,
    final double? textScaleFactor,
    final int? maxLines,
    final String? semanticsLabel,
    final TextWidthBasis? textWidthBasis,
    final textHeightBehavior,
    final FontWeight? fontWeight,
    final FontStyle? fontStyle,
    final double? height,
    final TextDecoration? textDecoration,
    final double? decorationThickness,
    final double? letterSpacing,
    final Color? decorationColor,
  }) {
    return TextWidget(
      text: text,
      style: GoogleFonts.poppins(
        color: colorText,
        letterSpacing: letterSpacing,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLines: maxLines,
    );
  }

  factory TextWidget.inter({
    required String text,
    Color? colorText,
    double? fontSize,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? textOverflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    textHeightBehavior,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? textDecoration,
    double? decorationThickness,
    double? letterSpacing,
    Color? decorationColor,
  }) {
    return TextWidget(
      text: text,
      style: GoogleFonts.inter(
        letterSpacing: letterSpacing,
        color: colorText ?? Colors.black,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLines: maxLines,
    );
  }

  factory TextWidget.roboto({
    required String text,
    Color? colorText,
    double? fontSize,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? textOverflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    textHeightBehavior,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? textDecoration,
    double? decorationThickness,
    double? letterSpacing,
    Color? decorationColor,
  }) {
    return TextWidget(
      text: text,
      style: GoogleFonts.roboto(
        letterSpacing: letterSpacing,
        color: colorText ?? Colors.black,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLines: maxLines,
    );
  }

  factory TextWidget.anton({
    required String text,
    Color? colorText,
    double? fontSize,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? textOverflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    textHeightBehavior,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? textDecoration,
    double? decorationThickness,
    double? letterSpacing,
    Color? decorationColor,
  }) {
    return TextWidget(
      text: text,
      style: GoogleFonts.anton(
        letterSpacing: letterSpacing,
        color: colorText ?? Colors.black,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: height,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
      textAlign: textAlign,
      textOverflow: textOverflow,
      maxLines: maxLines,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: style ??
          GoogleFonts.poppins(
            letterSpacing: letterSpacing,
            color: colorText ?? Colors.black,
            decorationThickness: decorationThickness,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            height: heigth,
            decoration: textDecoration,
            decorationColor: decorationColor,
          ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
