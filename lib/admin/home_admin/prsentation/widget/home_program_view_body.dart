import 'package:flutter/material.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_program.dart';
import 'package:quran_app/admin/home_admin/prsentation/widget/program_item.dart';

class HomeProgramViewBody extends StatelessWidget {
  const HomeProgramViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramItem(
          imageUrl: 'assets/program_image.png',
          title: "Program 1",
          description: 'Description 1',
         
        ),
      ],
    );
  }
}
