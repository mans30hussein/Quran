import 'package:flutter/material.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';

class ProgramCardTitleAndDesc extends StatelessWidget {
  const ProgramCardTitleAndDesc({super.key, required this.item});

  final ProgramModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.desc,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF8fbfa0),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
