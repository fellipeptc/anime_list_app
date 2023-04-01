import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../values_constant.dart';

class MyLoader extends StatelessWidget {
  final double? space;

  const MyLoader({
    this.space,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: space ?? 200),
          Lottie.asset(
            kLoader,
            width: 300,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
