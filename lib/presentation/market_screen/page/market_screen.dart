import 'package:flutter/material.dart';
import 'package:investynn/core/helper/custom_app_bar.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isHomeScreen: false,
        isMainScreen: true,
        title: 'Market',
        hasNotification: true,
      ),
    );
  }
}
