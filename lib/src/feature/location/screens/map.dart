import 'package:dine_dash_delivery/src/common/router/router.dart';
import 'package:dine_dash_delivery/src/feature/auth/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppbarWidget(
        onTap: () {
          context.goNamed(AppRoute.locationAccess.name);
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Text('map'),
    );
  }
}