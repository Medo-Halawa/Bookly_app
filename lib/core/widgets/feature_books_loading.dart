import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FeatureBooksLoading extends StatelessWidget {
  const FeatureBooksLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}
