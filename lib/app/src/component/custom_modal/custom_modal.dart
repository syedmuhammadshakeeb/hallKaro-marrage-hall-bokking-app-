import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/component/button/custom_button.dart';
import 'package:hall_karo/app/src/component/image/loading_image.dart';
import 'package:hall_karo/app/src/component/text/custom_text.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';
import 'package:hall_karo/app/src/utils/constant/style.dart';
import 'package:hall_karo/app/src/utils/constant/text_styles.dart';


class CustomModal extends StatelessWidget {
  final String? title;
  final String? headerTitle;
  final String? description;
  final Widget? content;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? onPositiveButtonPressed;
  final VoidCallback? onNegativeButtonPressed;
  final double? height, iconSize, positiveHPadding, spaceBetweenButtons;
  final Color? backgroundColor, iconColor;
  final TextStyle? textStyle, descriptionStyle;
  final String? icon;
  final bool isLoading, isPositiveBtnLoading;
  final TextStyle? headerTitleStyle, negativeButtonTextStyle;
  final List<Widget>? children;

  const CustomModal({
    super.key,
    this.title,
    this.description,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonPressed,
    this.onNegativeButtonPressed,
    this.height,
    this.positiveHPadding,
    this.spaceBetweenButtons,
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.content,
    this.iconColor,
    this.negativeButtonTextStyle,
    this.iconSize,
    this.descriptionStyle,
    this.isLoading = false,
    this.isPositiveBtnLoading = false,
    this.headerTitle,
    this.headerTitleStyle,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        decoration: BoxDecoration(color: backgroundColor),
        child: Padding(
          padding: headerTitle != null
              ? const EdgeInsets.only(top: 0, left: 16.0, right: 16, bottom: 16)
              : const EdgeInsets.all(16.0),
          child: children != null
              ? ListView(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: children!,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      AppStyle.space16,
                      LoadingImage(
                        image: icon,
                        color: iconColor,
                        height: iconSize,
                      ),
                    ],
                    AppStyle.space16,
                    if (headerTitle != null) ...[
                      CustomTextWidget(
                        text: headerTitle!,
                        textAlign: TextAlign.center,
                        style:
                            headerTitleStyle ??
                            TextStyle(
                              color: AppColors.black1C,
                              fontSize: 18,

                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      AppStyle.space24,
                    ],
                    if (title != null) ...[
                      CustomTextWidget(
                        text: title!,
                        style: textStyle,
                        textAlign: TextAlign.center,
                      ),
                      AppStyle.space16,
                    ],
                    // AppStyle.space16,
                    if (description != null) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomTextWidget(
                          text: description!,
                          style: descriptionStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      AppStyle.space24,
                    ],

                    if (content != null) ...[AppStyle.space30, content!],

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (negativeButtonText != null) ...[
                          Expanded(
                            child: CustomButtonWidget(
                              loading: isLoading,
                              borderRadius: 6,
                              onTap:
                                  onNegativeButtonPressed ??
                                  () => Navigator.pop(context),
                              text: negativeButtonText,
                              // widget: CustomTextWidget(
                              //   text: "Cancel",
                              //   style: AppTextStyles.primary16bold,
                              // ),
                              textStyle:
                                  negativeButtonTextStyle ??
                                  AppTextStyles.kPrimary14Bold.copyWith(
                                    color: AppColors.orangeDC,
                                  ),
                              backgroundColor: AppColors.kWhite,

                              borderColor: AppColors.kPrimary,
                            ),
                          ),
                        ],
                        SizedBox(width: spaceBetweenButtons ?? 0),
                        if (positiveButtonText != null) ...[
                          // AppStyle.gap10,
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: CustomButtonWidget(
                                hpadding: positiveHPadding ?? 12,
                                loading: isPositiveBtnLoading,
                                textStyle: AppTextStyles.whiteColor14Bold,
                                onTap:
                                    onPositiveButtonPressed ??
                                    () => Navigator.pop(context),
                                text: positiveButtonText,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
