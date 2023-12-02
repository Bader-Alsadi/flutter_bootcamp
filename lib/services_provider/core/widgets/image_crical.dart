
import 'package:flutter/material.dart';

class ImageCrical extends StatelessWidget {
  ImageCrical({super.key, this.size});
  Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.size!.height ?? 50,
      width: this.size!.width ?? 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: Image.asset(
          'assets/placeholder.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}