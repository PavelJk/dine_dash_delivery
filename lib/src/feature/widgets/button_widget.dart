import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {

  final void Function()? onPressed;

  const CustomButtonWidget({super.key, required  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        child: Text(
          "ПРОДОЛЖИТЬ",
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
