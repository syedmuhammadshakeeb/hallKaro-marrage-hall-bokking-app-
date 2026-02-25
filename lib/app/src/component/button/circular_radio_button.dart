
import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';


class CircularRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;

  const CircularRadioButton({
    super.key,
    required this.isSelected,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimary : Colors.transparent,
          // shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.kPrimary : AppColors.klightGrey70,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
