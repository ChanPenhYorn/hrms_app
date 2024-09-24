import 'package:flutter/material.dart';

extension SizeUtils on num {
  // For width
  Widget get w => SizedBox(
        width: toDouble(),
      );

  // For height
  Widget get h => SizedBox(
        height: toDouble(),
      );
}
