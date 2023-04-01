//VALUES LOTTIE FILE
import 'package:flutter/material.dart';

const String kLoader = 'assets/loader.json';
const String kEmptyState = 'assets/empty.json';

//VALUES API
const String kApiBase = 'https://kitsu.io/api/edge/anime';
const String kApiFilter = '?filter[text]=';

//VALUES COLOR
const Color kPurple = Color.fromARGB(255, 56, 6, 65);

//VALUES CONTAINER BORDER
const BoxDecoration borderOnlyBottom = BoxDecoration(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(40),
    bottomRight: Radius.circular(40),
  ),
);

extension BoxTheme on BoxDecoration {
  BoxDecoration cl(Color color) => copyWith(color: color);

  BoxDecoration get grad => copyWith(
        gradient: const LinearGradient(
          colors: [kPurple, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      );
}
