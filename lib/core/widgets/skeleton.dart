import 'package:codium/core/constants/style.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: CustomColors.darkAccentColor.withOpacity(0.04),
          borderRadius: const BorderRadius.all(Radius.circular(23))),
    );
  }
}
