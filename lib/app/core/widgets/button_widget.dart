import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marvel_characters/app/core/widgets/text_widget.dart';

import '../services/media_query_service.dart';

class CommonButton extends StatelessWidget {
  final bool alignTextCenter;

  final String title;
  final double? sizeTitle;
  final double? heightButton;
  final double? widthButton;
  final Function()? onPress;
  final Color? colorTitle;
  final Color? colorButton;
  final Color? colorBorder;
  final bool cleanButton;
  final bool boldText;
  final bool loading;
  final bool textUnderline;
  final Color? loadingColor;
  final bool iconRight;
  final bool iconLeft;
  final TextAlign? textAlign;
  final IconData? icon;
  final Color? colorIcon;
  final double? iconSize;
  final ButtonStyle? buttonStyle;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final BorderRadiusGeometry? borderRadius;
  final bool isFittedText;

  const CommonButton({
    Key? key,
    required this.title,
    this.sizeTitle = 10,
    this.heightButton,
    this.widthButton,
    this.onPress,
    this.colorTitle,
    this.colorIcon,
    this.colorButton,
    this.colorBorder,
    this.cleanButton = false,
    this.boldText = true,
    this.iconRight = false,
    this.iconLeft = false,
    this.loading = false,
    this.textUnderline = false,
    this.textAlign,
    this.loadingColor,
    this.icon,
    this.iconSize,
    this.buttonStyle,
    this.alignTextCenter = false,
    this.fontFamily,
    this.fontWeight,
    this.borderRadius,
    this.isFittedText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cleanButton) {
      return Center(
        child: !loading
            ? TextButton(
                onPressed: onPress,
                style: buttonStyle ??
                    ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                child: TextWidget(
                  text: title,
                  colorText: colorTitle ?? Colors.white,
                  fontWeight: fontWeight,
                  fontSize: sizeTitle,
                  fontFamily: fontFamily,
                  textDecoration:
                      textUnderline ? TextDecoration.underline : null,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SpinKitThreeBounce(
                  duration: const Duration(seconds: 3),
                  color: loadingColor ?? Colors.white,
                  size: 20,
                ),
              ),
      );
    }

    return SizedBox(
      width: widthButton ?? MediaQueryService.width(context),
      height: heightButton ?? 40,
      child: ElevatedButton(
        onPressed: loading ? null : onPress,
        style: onPress != null ? enableButtonStyle() : disableButtonStyle(),
        child: !loading
            ? Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: alignTextCenter
                        ? Center(
                            child: isFittedText
                                ? FittedBox(
                                    child: TextWidget(
                                      text: title,
                                      colorText: colorTitle ?? Colors.white,
                                      fontWeight: fontWeight,
                                      fontSize: sizeTitle,
                                      fontFamily: fontFamily,
                                      textDecoration: textUnderline
                                          ? TextDecoration.underline
                                          : null,
                                      textAlign: textAlign ?? TextAlign.center,
                                    ),
                                  )
                                : TextWidget(
                                    text: title,
                                    colorText: colorTitle ?? Colors.white,
                                    fontWeight: fontWeight,
                                    fontSize: sizeTitle,
                                    fontFamily: fontFamily,
                                    textDecoration: textUnderline
                                        ? TextDecoration.underline
                                        : null,
                                    textAlign: textAlign ?? TextAlign.center,
                                  ),
                          )
                        : isFittedText
                            ? FittedBox(
                                child: TextWidget(
                                  text: title,
                                  colorText: colorTitle ?? Colors.white,
                                  fontWeight: fontWeight,
                                  fontSize: sizeTitle,
                                  fontFamily: fontFamily,
                                  textDecoration: textUnderline
                                      ? TextDecoration.underline
                                      : null,
                                  textAlign: textAlign ?? TextAlign.center,
                                ),
                              )
                            : TextWidget(
                                text: title,
                                colorText: colorTitle ?? Colors.white,
                                fontWeight: fontWeight,
                                fontSize: sizeTitle,
                                fontFamily: fontFamily,
                                textDecoration: textUnderline
                                    ? TextDecoration.underline
                                    : null,
                                textAlign: textAlign ?? TextAlign.center,
                              ),
                  ),
                  if (iconRight)
                    Positioned(
                      right: 0,
                      child: Icon(
                        icon ?? Icons.arrow_forward_ios,
                        color: colorIcon ?? Colors.white,
                        size: iconSize ?? 20,
                      ),
                    ),
                  if (iconLeft)
                    Positioned(
                      left: 0,
                      child: Icon(
                        icon ?? Icons.keyboard_arrow_left_outlined,
                        color: colorIcon ?? Colors.white,
                        size: iconSize ?? 20,
                      ),
                    ),
                ],
              )
            : Center(
                child: SpinKitThreeBounce(
                  color: loadingColor ?? Colors.white,
                  size: 20,
                ),
              ),
      ),
    );
  }

  ButtonStyle enableButtonStyle() {
    return ButtonStyle(
      // overlayColor: MaterialStateProperty.all<Color>(
      //     AppColors.buttonsColor.withOpacity(0.1)),
      backgroundColor:
          MaterialStateProperty.all<Color>(colorButton ?? Colors.lightBlue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(22.0),
          side: colorBorder != null
              ? BorderSide(color: colorBorder!)
              : BorderSide.none,
        ),
      ),
    );
  }

  ButtonStyle disableButtonStyle() {
    final colorGrey = Colors.grey.shade900;

    return ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(
        colorGrey.withOpacity(0.1),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        colorButton?.withOpacity(0.4) ?? colorGrey.withOpacity(0.4),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(22.0),
          side: colorBorder != null
              ? BorderSide(color: colorBorder!)
              : BorderSide.none,
        ),
      ),
    );
  }
}
