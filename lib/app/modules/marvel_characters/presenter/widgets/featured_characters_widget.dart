import 'package:flutter/material.dart';
import 'package:marvel_characters/app/modules/marvel_characters/presenter/widgets/cards_widget.dart';

class FeatureCharactersWidget extends StatelessWidget {
  final List<CardData> cardDataList;
  final Widget? image;
  final Color? colorText;
  final double? fontSize;
  final Color? cardColor;
  final Axis? scrollDirection;
  final FadeInImage? fadeInImage;
  final double? heightImage;
  final double? widthImage;
  final Function()? onPressedIconInfo;

  const FeatureCharactersWidget({
    required this.cardDataList,
    this.image,
    this.onPressedIconInfo,
    this.colorText,
    this.fontSize,
    this.cardColor,
    this.scrollDirection,
    this.fadeInImage,
    this.heightImage,
    this.widthImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection ?? Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: cardDataList.map((cardData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CardsWidget(
                image: cardData.image ?? Image.network(''),
                text: cardData.title,
                onPressedIconInfo: cardData.onPressedInconInfo,
                fontSize: fontSize,
                colorText: colorText,
                cardColor: cardColor,
                fadeInImage: fadeInImage,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CardData {
  final Widget? image;
  final FadeInImage? fadeInImage;
  final String title;
  final int id;
  final Function() onPressedInconInfo;

  CardData({
    required this.image,
    required this.title,
    required this.id,
    required this.onPressedInconInfo,
    this.fadeInImage,
  });
}
