import 'package:flutter/material.dart';

class ZodiacCategoryItem extends StatelessWidget {
  final String image;
  final String title;

  const ZodiacCategoryItem({
    required this.image,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 53.27,
          height: 54,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
