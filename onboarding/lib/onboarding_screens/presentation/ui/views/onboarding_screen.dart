import 'package:commons/utils/constants/app_images.dart';
import 'package:commons/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import '../components/onboarding_app_bar.dart';
import '../components/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _navigateToDasboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: Text("todo navegacao")),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnboardingAppBar(),
      body: OnBoardingSlider(
          onFinish: _navigateToDasboard,
          finishButtonText: "Próximo",
          skipTextButton: const Text("pular"),
          totalPage: 3,
          controllerColor: ManageUTheme.primaryColor,
          pageBackgroundColor: Colors.white,
          headerBackgroundColor: Colors.white,
          finishButtonColor: ManageUTheme.primaryColor,
          background: [
            Container(),
            Container(),
            Container(),
          ],
          speed: 1.8,
          pageBodies: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OnboardingPageWidget(
                      img: AppImages.onboardingImage1,
                      title: "Personalize metas diarias",
                      subtitle:
                          "Adicione a seus colaboradores, valores e metas diarias, e confira em tempo real conquistas."),
                ],
              ),
            ),
            Container(
              child: OnboardingPageWidget(
                  img: AppImages.onboardingImage2,
                  title: "FeedBack",
                  subtitle:
                      "Tenha controle de todos os dados e valores a toda hora em qualquer lugar."),
            ),
            Container(
              child: OnboardingPageWidget(
                  img: AppImages.onboardingImage3,
                  title: "Chega de surtar",
                  subtitle:
                      "Adicione a seus colaboradores, valores e metas diarias, e confira em tempo real conquistas."),
            ),
          ]),
    );
  }
}
