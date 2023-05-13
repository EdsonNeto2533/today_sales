import 'package:flutter/material.dart';

import '../utils/theme/app_theme.dart';

class MainButtonWidget extends StatelessWidget {
  final Function buttonClicked;
  final String buttonText;

  const MainButtonWidget({
    super.key,
    required this.buttonClicked,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonClicked.call();
      },
      child: Text(
        buttonText,
        style: TextStyle(
          color: ManageUTheme.fadingGrey,
          fontSize: 20,
        ),
      ),
    );
  }
}
