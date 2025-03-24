import 'package:flutter/material.dart';

class MyTextFieldLocation extends StatelessWidget {
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const MyTextFieldLocation({super.key, this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.all(18),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
      controller: controller,
    );
  }
}