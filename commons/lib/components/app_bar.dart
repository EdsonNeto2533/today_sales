import 'package:flutter/material.dart';

import '../utils/constants/app_images.dart';

class ManageUAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget? bottomBar;
  ManageUAppBar({super.key, this.bottomBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Icon(Icons.menu),
      title: Image.asset(
        AppImages.appBanner,
        scale: 2,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
