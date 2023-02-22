import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:today_sale/commons/components/main_button.dart';
import 'package:today_sale/commons/utils/constants/app_images.dart';

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
