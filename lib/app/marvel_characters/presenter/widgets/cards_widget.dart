import 'package:flutter/material.dart';
import 'package:marvel_characters/app/core/widgets/text_widget.dart';

class CardsWidget extends StatelessWidget {
  final String text;
  final Image image;

  const CardsWidget({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 60;
    return Center(
      child: Container(
        height: categoryHeight,
        //margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image,
              const SizedBox(
                height: 5,
              ),
              TextWidget.poppins(
                text: text,
                colorText: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
