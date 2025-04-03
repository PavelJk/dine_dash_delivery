import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/resources/path_images.dart';

class MyAuthAndLocationAppbar extends StatelessWidget implements  PreferredSizeWidget {

  final void Function()? onTap;
  final Color? backgroundColor;
  final Color iconColor;
  const MyAuthAndLocationAppbar({super.key, this.onTap, this.backgroundColor, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 1),
              child: SvgPicture.asset(
                PathImages.back,
                width: 8,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
      leadingWidth: 73,
      toolbarHeight: 85,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(110);
}
