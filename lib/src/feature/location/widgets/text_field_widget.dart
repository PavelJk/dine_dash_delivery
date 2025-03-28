import 'package:flutter/material.dart';

class MyLocationTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String text;

  const MyLocationTextField({super.key, this.prefixIcon, this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 7,),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.all(15),
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
        ),
      ],
    );
  }
}