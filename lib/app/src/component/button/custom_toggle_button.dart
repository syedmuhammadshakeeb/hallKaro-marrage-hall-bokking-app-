import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';



class ToggleButton extends StatelessWidget {
  final Color trackColor, activeColor;
  final bool? isSelected;
  final Function(bool)? onChanged;

  const ToggleButton({
    super.key,
    this.trackColor = AppColors.kLightGreyBgColor,
    this.activeColor = AppColors.kPrimary,
    this.isSelected,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 34,
      child: Stack(
        children: [
          Container(
            // Fixed height and width is given so that
            // it won't get change in responsiveness
            // width: (isSelected ?? false) ? 50 : 60,
            // height: 40,
            alignment: Alignment.center, // Alignment as center
            decoration: BoxDecoration(
              // TODO: you can change here gradient color
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: (isSelected ?? false)
                    ? [AppColors.kPrimary, AppColors.kSecondaryColor]
                    : [AppColors.kTransparent, AppColors.kTransparent],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
          ),
          CupertinoSwitch(
            activeTrackColor: AppColors.kPrimary,

            // Colors.red,
            // Color.fromARGB(255, 255, 141, 2),
            // AppColors.kPrimary,
            value: isSelected ?? false,
            onChanged: onChanged,
          ),
          if (isSelected ?? false) ...[
            Positioned(
                right: 3,
                top: 3,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
          ]
        ],
      ),
    );
  }
}
