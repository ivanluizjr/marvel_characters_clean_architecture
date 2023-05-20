import 'package:flutter/material.dart';
import 'package:marvel_characters/app/core/services/media_query_service.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/widgets/cards_widget.dart';

class CharactersScrollerWidget extends StatelessWidget {
  const CharactersScrollerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQueryService.height(context) * 0.30 - 80;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: const FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Center(
                child: CardsWidget(
                  image: Image(image: AssetImage('')),
                  text: 'Automóvel',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: CardsWidget(
                  image: Image(image: AssetImage('')),
                  text: 'Automóvel',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: CardsWidget(
                  image: Image(image: AssetImage('')),
                  text: 'Automóvel',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: CardsWidget(
                  image: Image(image: AssetImage('')),
                  text: 'Automóvel',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Center(
                child: CardsWidget(
                  image: Image(image: AssetImage('')),
                  text: 'Automóvel',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
