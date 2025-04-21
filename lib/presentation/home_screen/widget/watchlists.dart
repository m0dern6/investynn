import 'package:flutter/material.dart';
import 'package:investynn/core/config/dimensions/dimensions.dart';

class Watchlists extends StatelessWidget {
  const Watchlists({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimensions(context).height(207),
      child: Center(child: Text('Watchlists')),
    );
  }
}
