import 'package:flutter/material.dart';
import '../../../../../core/utiles/colores.dart';

class AyahText extends StatelessWidget {
  final String text;
  final int number;

  const AyahText({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      buildSpan(text: text, number: number),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.rtl,
    );
  }

  static TextSpan buildSpan({required String text, required int number}) {
    return TextSpan(
      children: [
        TextSpan(
          text: "$text﴿$number﴾",
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Amiri', // Fallback font
            color: Colors.black,
            height: 2.0,
          ),
        ),
        const TextSpan(text: " "), // Space after the number
      ],
    );
  }
}
