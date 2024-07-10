import 'package:flutter/material.dart';

class Button2Custom extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final String? imagePath;
  Button2Custom({
    super.key,
    required this.onPressed,
    required this.label,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      width: 310,
      height: 40,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 24,
                height: 24,
              ),
            SizedBox(width: 12),
            Text(label),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          foregroundColor: Colors.grey[850],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}
