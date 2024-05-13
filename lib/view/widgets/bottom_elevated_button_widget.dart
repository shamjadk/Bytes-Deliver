import 'package:flutter/material.dart';

class BottomElevatedButtonWidget extends StatelessWidget {
  final String btnName;
  final VoidCallback onPressed;
  const BottomElevatedButtonWidget({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, foregroundColor: Colors.white),
          onPressed: onPressed,
          child:  Text(btnName),
        ),
      );
  }
}
