import 'package:flutter/material.dart';

import '../utils/constants/app_images.dart';

class ManageUAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? bottomBar;
  const ManageUAppBar({super.key, this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Image.asset(
        AppImages.appBanner,
        scale: 2,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
