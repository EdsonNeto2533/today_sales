import 'package:commons/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ValueLabelDivider extends StatelessWidget {
  final String label;
  final String value;
  const ValueLabelDivider({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: const Divider(
            height: 1,
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 24,
            left: 16,
            right: 16,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: ManageUTheme.fadingGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 40,
              color: ManageUTheme.fadingGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
