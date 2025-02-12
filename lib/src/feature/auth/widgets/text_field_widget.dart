import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  const CustomTextFieldWidget({super.key, this.inputFormatters, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
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
      inputFormatters: inputFormatters,
      controller: controller,
    );
  }
}