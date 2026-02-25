
import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';
import 'package:hall_karo/app/src/utils/constant/style.dart';
import 'package:hall_karo/app/src/utils/constant/text_styles.dart';

import '../button/custom_button.dart';
import '../image/loading_image.dart';
import '../text/custom_text.dart';

class CustomAlertDialog extends StatelessWidget {
  final bool canPop;
  final String? headerIcon;
  final double? headerIconWidth;
  final double? headerIconHeight;
  final String? headerTitle;
  final double? headerFont;
  final String? headerDesc;
  final String? btnText1;
  final Function? onBtnTap1;
  final String? btnText2;
  final Function? onBtnTap2;
  final Function? onPopInvoked;
  final List<Widget>? children;

  const CustomAlertDialog(
      {super.key,
      this.canPop = true,
      this.headerIcon,
      this.headerTitle,
      this.headerFont,
      this.headerDesc,
      this.btnText1,
      this.btnText2,
      this.onPopInvoked,
      this.children,
      this.onBtnTap1,
      this.onBtnTap2,
      this.headerIconWidth,
      this.headerIconHeight});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (_, res) {
        onPopInvoked?.call();
      },
      // canPop: canPop,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (canPop) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,
                            color: AppColors.kBlacktext, size: 24)),
                  ],
                ),
              ],
              AppStyle.space10,
              if (headerIcon != null) ...[
                SizedBox(
                  height: headerIconHeight ?? 100,
                  width: headerIconWidth,
                  child: LoadingImage(
                    boxfit: BoxFit.contain,
                    image: headerIcon ?? "",
                  ),
                  // child: SvgPicture.asset(AppIcons.bba),
                ),
                AppStyle.space24,
              ],
              if (headerTitle != null) ...[
                CustomTextWidget(
                  text: headerTitle ?? "",
                  style: TextStyle(
                      fontSize: headerFont ?? 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                AppStyle.space24,
              ],
              if (headerDesc != null) ...[
                CustomTextWidget(
                  text: headerDesc ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
                AppStyle.space24,
              ],
              if (children != null && children?.isNotEmpty == true) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children ?? [],
                )
              ],
              if (btnText1 != null || btnText2 != null) ...[
                AppStyle.space24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (btnText1 != null) ...[
                      Expanded(
                        child: CustomButtonWidget(
                            isApplyGradient: true,
                            borderRadius: 8.0,
                            size: ButtonSize.md,
                            onTap: () async {
                              onBtnTap1?.call();
                            },
                            text: btnText1 ?? ""),
                      ),
                    ],
                    if (btnText2 != null) ...[
                      AppStyle.gap6,
                      Expanded(
                        child: CustomButtonWidget(
                            isApplyGradient: true,
                            backgroundColor: AppColors.kWhite,
                            borderColor: AppColors.kPrimary,
                            textStyle: AppTextStyles.grey55f13w500
                                .copyWith(fontWeight: FontWeight.w500),
                            borderRadius: 8.0,
                            size: ButtonSize.md,
                            onTap: () async {
                              onBtnTap2?.call();
                            },
                            text: btnText2 ?? ""),
                      ),
                    ]
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
