import 'package:flutter/material.dart';

const EdgeInsets screenPadding = EdgeInsets.only(top: 60, left: 20, right: 20);

List<BoxShadow> shadowSmall = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1), // Shadow color
    spreadRadius: 5, // Spread radius
    blurRadius: 7, // Blur radius
    offset: Offset(0, 3), // Offset from the top-left corner
  ),
];
