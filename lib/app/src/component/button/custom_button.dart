import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/component/text/custom_text.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';


enum ButtonSize { xs, sm, md, lg }

enum ButtonType { elevated, text, outline }

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final bool fullWidth, isDisabled, isApplyGradient, loading, isDanger;
  final Widget? widget;
  final String? text;
  final ButtonSize size;
  final Color? borderColor, backgroundColor, loaderColor;
  final TextStyle? textStyle;
  final double? elevation,
      loaderSize,
      loaderWidth,
      width,
      height,
      widthFactor,
      borderRadius,
      hpadding,
      vpadding;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    this.text,
    this.widget,
    this.borderColor,
    this.loaderColor,
    this.fullWidth = false,
    this.isDisabled = false,
    this.loading = false,
    this.loaderSize,
    this.loaderWidth,
    this.width,
    this.height,
    this.widthFactor,
    this.isApplyGradient = false,
    this.isDanger = false,
    this.elevation = 0.0,
    this.size = ButtonSize.lg,
    this.hpadding,
    this.backgroundColor,
    this.borderRadius,
    this.vpadding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return width != null
        ? SizedBox(width: width, child: getElevatedButton())
        : FractionallySizedBox(
            widthFactor: fullWidth ? 1 : widthFactor,
            child: getElevatedButton(),
          );
  }

  getElevatedButton() {
    return InkWell(
      onTap: isDisabled || loading ? null : onTap,
      child: Container(
        height: height ?? 48.0,
        // width: width,
        padding: EdgeInsets.symmetric(
          horizontal: hpadding ?? 30.0,
          vertical: vpadding ?? 12.0,
        ),
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.kSecondaryColor
              : backgroundColor ?? AppColors.kPrimary,
          border: Border.all(
            color: isDisabled
                ? Colors.transparent
                : borderColor ?? AppColors.kTransparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 6),

          // gradient: !isDisabled && isApplyGradient
          //     ? AppGradient.blackVerticalGradient
          //     : null
        ),
        child: !loading
            ? Center(
                child: FittedBox(
                  child:
                      widget ??
                      CustomTextWidget(
                        text: text ?? "",
                        style: TextStyle(
                          fontSize: textStyle?.fontSize ?? 16,
                          color:
                              textStyle?.color ??
                              (isDisabled
                                  ? AppColors.klightGrey30
                                  : AppColors.kWhite),
                          fontWeight: textStyle?.fontWeight ?? FontWeight.w500,
                        ),
                      ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: loaderSize ?? 20,
                    width: loaderSize ?? 20,
                    child: CircularProgressIndicator(
                      strokeWidth: loaderWidth ?? 2,
                      color: loaderColor ?? AppColors.kWhite,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
