import 'package:flutter/material.dart';

class NavCardHomeButton extends StatelessWidget {

  final String text;
  final String nameImage;
  final void Function()? onTap;
  const NavCardHomeButton({super.key, required this.text, required this.nameImage, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(20)),
            child: Image.asset(nameImage),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge
        ),
      ],
    );
  }
}
