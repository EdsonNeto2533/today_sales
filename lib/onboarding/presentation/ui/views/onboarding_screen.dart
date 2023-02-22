import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:today_sale/commons/components/main_button.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';
import 'package:today_sale/dashboard/presentation/ui/views/dashboard_screen.dart';
import 'package:today_sale/onboarding/presentation/ui/components/onboarding_footer.dart';
import 'package:today_sale/onboarding/presentation/ui/components/onboarding_page_widget.dart';

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
        return const DashboardScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OnBoardingSlider(
          onFinish: _navigateToDasboard,
          finishButtonText: "Próximo",
          skipTextButton: const Text("pular"),
          totalPage: 3,
          indicatorAbove: true,
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
