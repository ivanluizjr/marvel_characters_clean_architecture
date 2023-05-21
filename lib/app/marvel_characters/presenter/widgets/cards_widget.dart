import 'package:flutter/material.dart';
import 'package:marvel_characters/app/core/services/media_query_service.dart';
import 'package:marvel_characters/app/core/themes/colors/app_colors.dart';
import 'package:marvel_characters/app/core/widgets/text_widget.dart';

class CardsWidget extends StatelessWidget {
  final String text;
  final Widget image;
  final Color? colorText;
  final double? fontSize;
  final Color? cardColor;
  final FadeInImage? fadeInImage;
  final double? heightImage;
  final double? widthImage;
  final Function()? onPressedIconInfo;

  const CardsWidget({
    Key? key,
    required this.text,
    required this.image,
    this.onPressedIconInfo,
    this.colorText,
    this.fontSize,
    this.cardColor,
    this.fadeInImage,
    this.heightImage,
    this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQueryService.height(context);
    final double widht = MediaQueryService.width(context);
    double heigthScreen = 0;
    double widhtScreen = 0;

    if (height < 600) {
      heigthScreen = height * 0.56 - 63;
      widhtScreen = widht * 0.70 - 63;
    } else if (height >= 600) {
      heigthScreen = height * 0.41 - 63;
      widhtScreen = widht * 0.60 - 63;
    }

    return Container(
      height: heigthScreen,
      width: widhtScreen,
      decoration: BoxDecoration(
        color: cardColor ?? AppColors.write,
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: image,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Column(
              children: [
                TextWidget.roboto(
                  text: text,
                  colorText: colorText ?? AppColors.black,
                  fontSize: fontSize ?? 14,
                  fontWeight: FontWeight.bold,
                  //textAlign: TextAlign.center,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget.inconsolata(
                        text: 'More Info',
                        colorText: colorText ?? AppColors.black,
                        fontSize: fontSize ?? 14,
                        fontWeight: FontWeight.bold,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_right),
                        onPressed: onPressedIconInfo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
