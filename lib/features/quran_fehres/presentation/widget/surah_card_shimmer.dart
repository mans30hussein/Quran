import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SurahCardShimmer extends StatelessWidget {
  const SurahCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 20, backgroundColor: Colors.white),
            const SizedBox(width: 12),
            Container(width: 100, height: 20, color: Colors.white),
            const Expanded(child: SizedBox()),
            Column(
              children: [
                Container(width: 40, height: 12, color: Colors.white),
                const SizedBox(height: 4),
                Container(width: 30, height: 12, color: Colors.white),
              ],
            ),
            const SizedBox(width: 16),
            Container(width: 30, height: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
