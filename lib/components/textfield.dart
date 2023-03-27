import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.hintText,
    required this.obscuredtext,
    required this.textEditingController
  });

  final String hintText;
  final bool obscuredtext;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: textEditingController,
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
