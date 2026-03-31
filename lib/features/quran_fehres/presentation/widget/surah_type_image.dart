import 'package:flutter/material.dart';

class SurahTypeImage extends StatelessWidget {
  const SurahTypeImage({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl ??
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL1EG89HBcWC9ttte9rNlU9uFCBMKx0JymNw&s",
        height: 35,
        width: 35,
        fit: BoxFit.fill,
      ),
    );
  }
}
