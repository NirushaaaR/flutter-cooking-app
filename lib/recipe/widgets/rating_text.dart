import 'package:flutter/material.dart';

class RatingText extends StatelessWidget {
  final double rating;
  final double? bottom;
  final double? right;

  const RatingText({
    Key? key,
    required this.rating,
    this.bottom,
    this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom ?? 20,
      right: right ?? 20,
      child: Container(
        width: 60,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.black.withOpacity(0.55),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.star_rate,
              color: Colors.orange,
            ),
            const SizedBox(width: 3),
            Text(
              rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
