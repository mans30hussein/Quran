import 'package:flutter/material.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card_image.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/home_program_widget/program_card_title_and_desc.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({
    super.key,
    required this.item,
  });

  final ProgramModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF152e1e),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0x26c9a227),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Image ──────────────────────────────────
          ProgramCardImage(item: item),
                        
          // ── Gold bar ───────────────────────────────
          Container(
            height: 3,
            color: const Color(0xFFc9a227),
          ),
                        
          // ── Content ────────────────────────────────
          ProgramCardTitleAndDesc(item: item),
        ],
      ),
    );
  }
}
