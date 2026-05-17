import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/admin/home_admin/data/model/program_model.dart';

class ProgramCardImage extends StatelessWidget {
  const ProgramCardImage({
    super.key,
    required this.item,
  });

  final ProgramModel item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child:CachedNetworkImage(
        imageUrl: item.imageUrl ?? "",
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) => Container(
          height: 200,
          color: const Color(0xFF1a3a28),
          child: const Icon(
            Icons.mosque,
            size: 64,
            color: Color(0x80c9a227),
          ),
        ),
        placeholder: (_, __) => Container(
          height: 200,
          color: const Color(0xFF1a3a28),
          child: const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFc9a227),
            ),
          ),
        ),
      ),
      
      
     
    );
  }
}
