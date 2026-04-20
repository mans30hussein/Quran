import 'package:flutter/material.dart';
import '../../../../../core/utiles/colores.dart';

class SurahHeader extends StatelessWidget {
  final String surahName;
  final int ayahCount;

  const SurahHeader({
    super.key,
    required this.surahName,
    required this.ayahCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.quranPageBorder, width: 2),
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage(
            'assets/icons/prod/icon.jpeg',
          ), // Placeholder for decorative background
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoItem("آياتها", ayahCount.toString()),
          Text(
            "سورة $surahName",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.quranSurahHeader,
              fontFamily: 'Amiri', // Fallback font
            ),
          ),
          _buildInfoItem("ترتيبها", "3"), // This should be dynamic if available
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.quranPageBorder,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.quranPageBorder,
          ),
        ),
      ],
    );
  }
}
