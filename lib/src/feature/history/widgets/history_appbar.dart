import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HistoryAppBar extends StatelessWidget implements PreferredSizeWidget{
  final TabController? controller;
  final String title;
  final String textTabBarOne;
  final String textTabBarTwo;

  const HistoryAppBar({super.key, this.controller, required this.title, required this.textTabBarOne, required this.textTabBarTwo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 68,
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),
          ),
        ),
        bottom: TabBar(
          splashFactory: NoSplash.splashFactory,
          dividerColor: Color(0xffCED7DF),
          unselectedLabelColor: Color(0xffA5A7B9),
          controller: controller,
          tabs: [
            Tab(text: textTabBarOne),
            Tab(text: textTabBarTwo),
          ],
        ),
        leading: Padding(
        padding: const EdgeInsets.only(left: 24, top: 12),
        child: GestureDetector(
          onTap: (){
            context.pop('value');
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
  Size get preferredSize => Size.fromHeight(120);
}