import 'package:flutter/material.dart';

class MyTypeBuildingButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final bool isCheckPressButton;

  const MyTypeBuildingButton({super.key, this.onTap, required this.text, required this.isCheckPressButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 94,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isCheckPressButton ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(22.5)),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
