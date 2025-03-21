import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/resources/path_images.dart';

class MySliverAppbarHomeWidget extends StatelessWidget {
  final void Function()? onTap;
  final DropdownButton<String> dropdownButton;
  const MySliverAppbarHomeWidget({super.key, this.onTap, required this.dropdownButton});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      pinned: true,
      toolbarHeight: 60,
      title: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ДОСТАВИТЬ В',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 12,
              ),
            ),
            dropdownButton,
          ],
        ),
      ),
      leading: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Theme.of(context).colorScheme.onTertiary,
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: SvgPicture.asset(
              PathImages.menu,
              width: 21,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
          },
          child: Stack(
            children: [
              SizedBox(
                width: 55,
                child: CircleAvatar(
                  radius: 31,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: SvgPicture.asset(
                    PathImages.corzina,
                    width: 24,
                  ),
                ),
              ),
               Positioned(
                right: 0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  child: Text(
                    '2',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
