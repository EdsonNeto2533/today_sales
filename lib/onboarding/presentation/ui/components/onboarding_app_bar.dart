import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';
import 'package:today_sale/commons/utils/theme/app_theme.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ManageUTheme.primaryColor,
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Image.asset(AppImages.appBanner),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize * 2;
}
