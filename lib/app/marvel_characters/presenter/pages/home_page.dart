import 'package:flutter/material.dart';
import 'package:marvel_characters/app/core/constants/locales/home/home_locales.dart';
import 'package:marvel_characters/app/core/themes/colors/app_colors.dart';
import 'package:marvel_characters/app/core/widgets/text_widget.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/widgets/characters_scroller_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CharactersScrollerWidget charactersScrollerWidget =
      const CharactersScrollerWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorApp,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.sort_rounded,
                  size: 30,
                  color: AppColors.write,
                ),
                TextWidget.anton(
                  text: HomeLocales.marvel.toUpperCase(),
                  fontSize: 25,
                  colorText: AppColors.write,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
                const Icon(
                  Icons.search_rounded,
                  size: 30,
                  color: AppColors.write,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: charactersScrollerWidget,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
