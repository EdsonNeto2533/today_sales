import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';

class MainButtonWidget extends StatelessWidget {
  Function buttonClicked;
  String buttonText;

  MainButtonWidget({
    super.key,
    required this.buttonClicked,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
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
      ),
    );
  }
}
