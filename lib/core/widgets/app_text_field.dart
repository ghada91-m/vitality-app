
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextField extends StatelessWidget {

  final String hint;

  final IconData icon;

  final bool obscureText;

  final Widget? suffixIcon;

  final TextInputType keyboardType;

  final Function(String)? onChanged;

  final String? Function(String?)? validator;

  final TextEditingController? controller;

  const AppTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,

      obscureText: obscureText,

      keyboardType: keyboardType,

      onChanged: onChanged,

      validator: validator,

      cursorColor: AppColors.primary,

      decoration: InputDecoration(

        hintText: hint,

        hintStyle: const TextStyle(

          color: AppColors.textLight,
        ),

        prefixIcon: Icon(

          icon,

          color: AppColors.primary,
        ),

        suffixIcon: suffixIcon,

        filled: true,

        fillColor: AppColors.white,

        contentPadding:
        const EdgeInsets.symmetric(
          vertical: 18,
        ),

        border: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(20),

          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(20),

          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(

          borderRadius:
          BorderRadius.circular(20),

          borderSide: BorderSide(

            color:
            AppColors.primary
                .withOpacity(0.20),

            width: 1.5,
          ),
        ),
      ),
    );
  }
}