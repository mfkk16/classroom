import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';

class ErrorTryagainWidget extends StatelessWidget {
  final Function onPressed;

  const ErrorTryagainWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Something wrong", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => onPressed,
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), backgroundColor: Colors.red[50]),
            child: const Text("Try Again", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
