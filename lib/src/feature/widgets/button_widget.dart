import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonWidget extends StatelessWidget {

  final void Function()? onPressed;
  final String text;
  final String? assetName;
  final bool? isImagesText;
  const CustomButtonWidget({super.key, required  this.onPressed, required this.text, this.isImagesText, this.assetName});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            isImagesText != null ? Padding(
              padding: const EdgeInsets.only(left: 7),
              child: SvgPicture.asset(
                assetName!,
              ),
            ):
            SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
