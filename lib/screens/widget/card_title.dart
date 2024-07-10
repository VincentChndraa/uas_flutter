import 'package:flutter/material.dart';

class BoxTitle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;

  const BoxTitle({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLoading
              ? Container(
                  height: 15,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade300,
                  ),
                )
              : Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
          isLoading
              ? Container(
                  height: 15,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade300,
                  ),
                )
              : TextButton(
                  onPressed: onPressed,
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
