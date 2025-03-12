import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String iconName;
  const NavButtonWidget({super.key, this.onTap, required this.text, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 62,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconName),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
