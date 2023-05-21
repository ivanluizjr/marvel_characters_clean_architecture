import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/app/core/constants/images/app_images.dart';
import 'package:marvel_characters/app/core/constants/locales/home/home_locales.dart';
import 'package:marvel_characters/app/core/services/media_query_service.dart';
import 'package:marvel_characters/app/core/themes/colors/app_colors.dart';
import 'package:marvel_characters/app/core/widgets/text_widget.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/cubit/home_cubit.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/cubit/states/home_states.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/widgets/featured_characters_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  final HomeCubit cubit;

  const HomePage({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int id = 1011334;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.cubit.getMarvelCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQueryService.height(context);
    double heigthListCard = 0;

    if (height < 600) {
      heigthListCard = height * 0.22;
    } else if (height >= 600) {
      heigthListCard = height * 0.41;
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColorApp,
      body: SafeArea(
        child: SingleChildScrollView(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 35,
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextWidget.roboto(
                        text: 'Popular',
                        fontSize: 20,
                        colorText: AppColors.write,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<HomeCubit, IHomeStates>(
                bloc: widget.cubit,
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.black12,
                        child: FeatureCharactersWidget(
                          cardDataList: [
                            CardData(
                              image: Image.asset(
                                AppImages.logoMarvel,
                                width: 50,
                                height: 50,
                              ),
                              id: 0,
                              title: 'Shimmer',
                              onPressedInconInfo: () {},
                            ),
                            CardData(
                              image: Image.asset(
                                AppImages.logoMarvel,
                                width: 50,
                                height: 50,
                              ),
                              id: 0,
                              title: 'Shimmer',
                              onPressedInconInfo: () {},
                            ),
                            CardData(
                              image: Image.asset(
                                AppImages.logoMarvel,
                                width: 50,
                                height: 50,
                              ),
                              id: 0,
                              title: 'Shimmer',
                              onPressedInconInfo: () {},
                            ),
                            CardData(
                              image: Image.asset(
                                AppImages.logoMarvel,
                                width: 50,
                                height: 50,
                              ),
                              id: 0,
                              title: 'Shimmer',
                              onPressedInconInfo: () {},
                            ),
                            CardData(
                              image: Image.asset(
                                AppImages.logoMarvel,
                                width: 50,
                                height: 50,
                              ),
                              id: 0,
                              title: 'Shimmer',
                              onPressedInconInfo: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    if (state is HomeSuccessState) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: FeatureCharactersWidget(
                          cardDataList: [
                            CardData(
                              image: Image.network(
                                state.thumbnails[1].path,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/marvel_logo.png',
                                  );
                                },
                              ),
                              id: state.ids[1],
                              title: state.names[1],
                              onPressedInconInfo: () {
                                _showModal(
                                  title: state.names[1],
                                  description: state.descriptions[1],
                                  context: context,
                                );
                              },
                            ),
                            CardData(
                              image: Image.network(
                                state.thumbnails[0].path,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/marvel_logo.png',
                                  );
                                },
                              ),
                              id: state.ids[0],
                              title: state.names[0],
                              onPressedInconInfo: () {
                                _showModal(
                                  title: state.names[0],
                                  description: 'Sem Descrição',
                                  context: context,
                                );
                              },
                            ),
                            CardData(
                              image: Image.network(
                                state.thumbnails[2].path,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/marvel_logo.png',
                                  );
                                },
                              ),
                              id: state.ids[4],
                              title: state.names[4],
                              onPressedInconInfo: () {
                                _showModal(
                                  title: state.names[4],
                                  description: state.descriptions[4],
                                  context: context,
                                );
                              },
                            ),
                            CardData(
                              image: Image.network(
                                state.thumbnails[10].path,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/marvel_logo.png',
                                  );
                                },
                              ),
                              id: state.ids[10],
                              title: state.names[10],
                              onPressedInconInfo: () {
                                _showModal(
                                  title: state.names[10],
                                  description: state.descriptions[10],
                                  context: context,
                                );
                              },
                            ),
                            CardData(
                              image: Image.network(
                                state.thumbnails[14].path,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/marvel_logo.png',
                                  );
                                },
                              ),
                              id: state.ids[14],
                              title: state.names[14],
                              onPressedInconInfo: () {
                                _showModal(
                                  title: state.names[14],
                                  description: 'Sem descrição',
                                  context: context,
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }
                },
              ),
              BlocBuilder<HomeCubit, IHomeStates>(
                bloc: widget.cubit,
                builder: (context, state) {
                  if (state is HomeSuccessState) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 90,
                                height: 35,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextWidget.roboto(
                                  text: 'Todos',
                                  fontSize: 20,
                                  colorText: AppColors.write,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: heigthListCard,
                            width: MediaQueryService.width(context),
                            child: ListView.builder(
                              itemCount: state.list.length,
                              itemBuilder: (context, index) {
                                final cardData = state.list[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.write,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 220,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            height: 185,
                                            child: Image.network(
                                              cardData.thumbnail.path,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/marvel_logo.png',
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: TextWidget.roboto(
                                                  text: cardData.name,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, left: 5),
                                                child: TextWidget.inter(
                                                    text: cardData.description,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showModal({
  required String title,
  required String description,
  required BuildContext context,
}) {
  showModalBottomSheet(
      backgroundColor: AppColors.backgroundColorApp,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget.poppins(
                    text: title,
                    colorText: AppColors.write,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextWidget.poppins(
                      text: description,
                      colorText: AppColors.write,
                      fontSize: 15,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}
