import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../commons/utils/theme/app_theme.dart';

class OnboardingFooterDots extends StatefulWidget {
  int selectedIndex;
  Function(int) selectedIndexClicked;
  int numberOfIndex;

  List<int> get _listSize {
    return List.generate(numberOfIndex, (index) => index);
  }

  OnboardingFooterDots(
      {super.key,
      required this.selectedIndex,
      required this.selectedIndexClicked,
      required this.numberOfIndex});

  @override
  State<OnboardingFooterDots> createState() => _OnboardingFooterState();
}

class _OnboardingFooterState extends State<OnboardingFooterDots> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget._listSize.map((index) {
        return GestureDetector(
          onTap: (() {
            setState(() {
              widget.selectedIndex = index;
              widget.selectedIndexClicked.call(index);
            });
          }),
          child: Container(
            height: 48,
            width: 48,
            child: Text(
              "\u2022",
              style: TextStyle(
                fontSize: 48,
                color: widget.selectedIndex == index
                    ? ManageUTheme.primaryColor
                    : Colors.grey,
              ),
            ),
          ),
        );
      }).toList(),
    );
    ;
  }
}
