import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RecipeDetailAppBar extends StatelessWidget {
  const RecipeDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            iconSize: 28,
            onPressed: () {
              print('Bookmark');
            },
            icon: const Icon(
              Icons.bookmark,
              color: Colors.orange,
            ),
          ),
        )
      ],
    );
  }
}
