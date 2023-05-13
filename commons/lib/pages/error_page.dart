import 'package:commons/components/main_button.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_images.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback retryClicked;
  const ErrorPage({
    super.key,
    required this.retryClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        const Center(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Image.asset(
            AppImages.errorImage,
          ),
        ),
        const Text(
          "ERRO",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 48,
            color: Colors.red,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: const Text(
            "Ocorreu um erro durante a exibição dessa página, por favor confira sua conexão ou atualize seu dispositivo.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          width: double.infinity,
          child: MainButtonWidget(
            buttonClicked: retryClicked,
            buttonText: "Recarregar",
          ),
        )
      ],
    );
  }
}
