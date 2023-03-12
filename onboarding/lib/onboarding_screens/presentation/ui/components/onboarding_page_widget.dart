import 'package:commons/utils/theme/app_theme.dart';
import 'package:flutter/widgets.dart';

class OnboardingPageWidget extends StatelessWidget {
  String title;
  String subtitle;
  String img;
  OnboardingPageWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(img),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          child: Text(
            title,
            style: TextStyle(
              color: ManageUTheme.fadingGrey,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
          ),
          child: Text(
            subtitle,
            style: TextStyle(
              color: ManageUTheme.fadingGrey,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
