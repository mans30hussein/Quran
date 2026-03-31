import 'package:flutter/material.dart';
import 'package:quran_app/core/network/text_constant.dart';
import 'package:quran_app/core/utiles/colores.dart';
import 'package:quran_app/core/utiles/styles.dart';
import 'package:quran_app/feature/quran_fehres/ui/widget/quran_fehres_view_body.dart';

class QuranFehresView extends StatelessWidget {
  const QuranFehresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDBD77),
      appBar: AppBar(
        backgroundColor: Color(0xffFDBD77),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 32, color: AppColors.primaryColor),
        ),
        centerTitle: true,
        title: Text(
          TextConstant.appTitle,
          style: AppStyles.textStyle24BoldPrimary,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: QuranFehresViewBody(),
      ),
    );
  }
}

