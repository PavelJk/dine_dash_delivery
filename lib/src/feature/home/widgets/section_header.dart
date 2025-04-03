import 'package:dine_dash_delivery/src/common/resources/path_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MySectionHeadersHome extends StatelessWidget {
  final String text;
  const MySectionHeadersHome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: TextButton.icon(
            onPressed: () {},
            label: Text(
              'Смотреть все',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: SvgPicture.asset(
                PathImages.forward,
              ),
            ),
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
              enableFeedback: false,
            ),
          ),
        ),
      ],
    );
  }
}
