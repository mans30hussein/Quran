import 'package:flutter/material.dart';

class ProgramCardSkeleton extends StatelessWidget {
  const ProgramCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF152e1e),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0x26c9a227), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Fake Image ──────────────────────────────
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              height: 200,
              color: const Color(0xFF1a3a28),
            ),
          ),

          // ── Gold bar ────────────────────────────────
          Container(height: 3, color: const Color(0xFFc9a227)),

          // ── Fake Content ────────────────────────────
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Fake title
                Container(
                  width: 160,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a3a28),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 12),

                // Fake desc line 1
                Container(
                  width: double.infinity,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a3a28),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 8),

                // Fake desc line 2
                Container(
                  width: 220,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a3a28),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(height: 8),

                // Fake desc line 3
                Container(
                  width: 180,
                  height: 14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a3a28),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}