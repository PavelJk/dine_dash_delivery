import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../common/resources/path_images.dart';

class AppbarWidget extends StatelessWidget implements  PreferredSizeWidget {

  final void Function()? onTap;
   const AppbarWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            child: Padding(
              padding: const EdgeInsets.only(right: 1),
              child: SvgPicture.asset(
                PathImages.back,
                width: 8,
              ),
            ),
          ),
        ),
      ),
      leadingWidth: 75,
      toolbarHeight: 110,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110);
}
