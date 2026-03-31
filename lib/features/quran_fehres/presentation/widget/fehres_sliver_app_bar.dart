import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';

class FehresSliverAppBar extends StatelessWidget {
  const FehresSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xffFDBD77),
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.menu, size: 32, color: AppColors.primaryColor),
      ),
      centerTitle: true,
      title: Text(
        TextConstant.appTitle,
        style: AppStyles.textStyle24BoldPrimary,
      ),
      //pinned: true,
      elevation: 0,
    );
  }
}
