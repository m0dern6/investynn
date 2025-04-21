import 'package:flutter/material.dart';
import 'package:investynn/core/helper/custom_app_bar.dart';

class MoreServicesScreen extends StatelessWidget {
  const MoreServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isHomeScreen: false,
        isMainScreen: true,
        title: 'More Services',
        hasNotification: true,
      ),
    );
  }
}
