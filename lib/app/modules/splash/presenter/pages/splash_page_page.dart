import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/core/constants/locales/routes/app_routes.dart';
import 'package:marvel_characters/app/core/services/media_query_service.dart';
import 'package:marvel_characters/app/core/themes/colors/app_colors.dart';

class SplashPagePage extends StatefulWidget {
  const SplashPagePage({super.key});

  @override
  _SplashPagePageState createState() => _SplashPagePageState();
}

class _SplashPagePageState extends State<SplashPagePage> {
  Future splashNavigation() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        Modular.to.pushNamed(AppRoutes.homePageRoute);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQueryService.width(context),
        height: MediaQueryService.height(context),
        color: AppColors.backgroundColorApp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/marvel_splash.png'),
            const CircularProgressIndicator(
              color: AppColors.write,
            ),
          ],
        ),
      ),
    );
  }
}
