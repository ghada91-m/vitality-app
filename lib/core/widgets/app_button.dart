import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppButton extends StatelessWidget {

  final String text;

  final VoidCallback onPressed;

  final Color? backgroundColor;

  final Color? textColor;

  final double height;

  final double borderRadius;

  final bool isLoading;

  final double fontSize;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height = 58,
    this.borderRadius = 22,
    this.isLoading = false,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      width: double.infinity,

      height: height,

      child: ElevatedButton(

        onPressed:
        isLoading ? null : onPressed,

        style: ElevatedButton.styleFrom(

          backgroundColor:
          backgroundColor ??
              AppColors.primary,

          foregroundColor:
          textColor ??
              Colors.white,

          disabledBackgroundColor:
          AppColors.primary.withOpacity(0.6),

          disabledForegroundColor:
          Colors.white,

          shadowColor:
          AppColors.primary.withOpacity(0.20),

          surfaceTintColor:
          Colors.transparent,

          elevation: 5,

          animationDuration:
          const Duration(
            milliseconds: 250,
          ),

          shape: RoundedRectangleBorder(

            borderRadius:
            BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),

        child: isLoading

            ? const SizedBox(

          width: 22,

          height: 22,

          child:
          CircularProgressIndicator(

            color: Colors.white,

            strokeWidth: 2.5,
          ),
        )

            : Text(

          text,

          style: TextStyle(

            color:
            textColor ??
                Colors.white,

            fontSize: fontSize,

            fontWeight:
            FontWeight.w800,

            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}