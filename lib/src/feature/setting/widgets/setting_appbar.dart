import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SettingsAppBar extends StatelessWidget implements  PreferredSizeWidget{
  final String text;

  const SettingsAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 68,
        toolbarHeight: 75,
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18
          ),
        ),
        leading: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: GestureDetector(
          onTap: (){
            context.goNamed(AppRoute.mainHome.name);
          },
          child: CircleAvatar(
            backgroundColor: Color(0xffECF0F4),
            child: Padding(
              padding: const EdgeInsets.only(right: 1),
              child: SvgPicture.asset(
                PathImages.back,
                width: 8,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(75);
}