import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.hintText,
    required this.obscuredtext,
  });

  final String hintText;
  final bool obscuredtext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          obscureText: obscuredtext,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              )),
        ),
      ),
    );
  }
}
