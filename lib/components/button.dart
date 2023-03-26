import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    this.buttonIcon,
    required this.buttonTextColor,
  });
  final Color buttonTextColor;
  final String buttonName;
  final Color buttonColor;
  final Icon? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 70,
        width: 600,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(buttonIcon),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    child: buttonIcon,
                  ),
                ],
              ),
              Text(
                buttonName,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
