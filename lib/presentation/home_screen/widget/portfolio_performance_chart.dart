import 'package:flutter/material.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';

class PortfolioPerformanceChart extends StatelessWidget {
  const PortfolioPerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions(context).height(371),
      child: Center(child: Text('Portfolio Performance Chart')),
    );
  }
}
