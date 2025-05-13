import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCustomTransactionTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String text;
  final bool? obscureText;


  const MyCustomTransactionTextField({
    super.key, 
    this.inputFormatters, 
    this.controller, 
    this.validator, this.hintText, this.obscureText, required this.text, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xffA0A5BA)),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 18),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide.none
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
          ),
          inputFormatters: inputFormatters,
          keyboardType: TextInputType.number,
          obscureText: obscureText == null ? false : true,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}