import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';




class RadioPainter extends CustomPainter {
  final bool isSelected;
  final Color? color;

  RadioPainter(this.isSelected, {this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outerCirclePaint = Paint()
      ..color =  color ?? (isSelected ? AppColors.kPrimary : Colors.grey)
      ..style = isSelected ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint innerCirclePaint = Paint()
      ..color = isSelected ? AppColors.kWhite : AppColors.kPrimary
      ..style = PaintingStyle.fill;

    // Outer circle
    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2,
      outerCirclePaint,
    );

    // Inner circle
    if (isSelected) {
      canvas.drawCircle(
        size.center(Offset.zero),
        size.width / 4,
        innerCirclePaint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
