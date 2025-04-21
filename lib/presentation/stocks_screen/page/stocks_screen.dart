import 'package:flutter/material.dart';
import 'package:investynn/core/helper/custom_app_bar.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isHomeScreen: false,
        isMainScreen: true,
        title: 'Stocks',
        hasNotification: true,
      ),
    );
  }
}
