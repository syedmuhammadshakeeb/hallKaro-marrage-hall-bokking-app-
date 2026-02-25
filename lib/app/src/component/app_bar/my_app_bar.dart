import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hall_karo/app/src/component/image/loading_image.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';
import 'package:hall_karo/app/src/utils/constant/style.dart';
import 'package:hall_karo/app/src/utils/constant/text_styles.dart';
import 'package:hall_karo/app/src/utils/extensions/custom_extensions.dart';

import '../text/custom_text.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height, elevation, bottomHeight;
  final bool isBack, isHome, isDark, isActionShare, isCenter;
  final String? title, backIcon;
  final TextStyle? titleStyle;
  final String? actionTitle, actionIcon1, actionIcon2, leadingIcon;
  final Widget? bottomWidget, titleWidget, leadingWidget, actionWidget;
  final bool? isBottomBorder, isApplyGradient;
  final double? leadingWidth, topPadding, hpadding;
  final Function()? onTapAction1, onTapAction2, onTapActionTitle, onTapLeading;
  final Color? iconColor1, leadinColor, backgroundColor;

  const MyAppBar({
    super.key,
    this.leadingWidget,
    this.title,
    this.titleStyle,
    this.elevation = 0.1,
    this.leadingIcon,
    this.onTapLeading,
    this.isApplyGradient = false,
    this.backIcon,
    this.isActionShare = false,
    this.isBack = false,
    this.isCenter = true,
    this.isHome = false,
    this.isDark = false,
    this.bottomWidget,
    this.height = kToolbarHeight,
    this.hpadding,
    this.bottomHeight = 0.0,
    this.actionTitle,
    this.actionIcon1,
    this.leadingWidth,
    this.titleWidget,
    this.onTapAction1,
    this.actionWidget,
    this.backgroundColor,
    this.onTapAction2,
    this.actionIcon2,
    this.onTapActionTitle,
    this.isBottomBorder = true,
    this.topPadding,
    this.iconColor1,
    this.leadinColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(height + (topPadding ?? 0));

  @override
  Widget build(BuildContext context) {
    // final isArabic = context.locale.languageCode == "ar";

    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: hpadding ?? 0,
        ).copyWith(top: topPadding ?? 0),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: isBack ? 15 : null,
          elevation: elevation,
          surfaceTintColor: isDark
              ? AppColors.kdarkgrey28
              : AppColors.scaffoldBackgroundColor,
          backgroundColor: backgroundColor ?? AppColors.kWhite,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: AppColors.scaffoldBackgroundColor,
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
          ),
          centerTitle: isCenter,
          leadingWidth: (isBack) ? 35 : leadingWidth,
          leading:
              leadingWidget ??
              (leadingIcon != null && onTapLeading != null
                  ? InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        onTapLeading?.call();
                      },
                      child: RotatedBox(
                        quarterTurns: context.isArabicLocale ? 90 : 0,
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: LoadingImage(
                              boxfit: BoxFit.contain,
                              image: leadingIcon,
                              color: leadinColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ((isBack)
                        ? InkWell(
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back),
                              // LoadingImage(
                              //   boxfit: BoxFit.contain,
                              //   image: AppIcons.backIcon,
                              // ),
                            ),
                          )
                        : null)),
          title:
              titleWidget ??
              (title != null
                  ? CustomTextWidget(
                      text: title ?? "",
                      style: titleStyle ?? AppTextStyles.primary18Bold,
                      overflow: TextOverflow.ellipsis,
                    )
                  : isHome
                  ? const SizedBox.shrink()
                  : null),
          actions: [
            if (actionWidget != null) ...[actionWidget!],
            if (actionIcon1 != null && onTapAction1 != null) ...[
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: onTapAction1,
                child: LoadingImage(
                  boxfit: BoxFit.contain,
                  image:
                      // isActionShare ?
                      //  AppIcons.shareIcon :
                      actionIcon1,
                  color: iconColor1,
                  height: 20,
                  width: 20,
                ),
              ),
              AppStyle.gap12,
            ],
            if (actionIcon2 != null && onTapAction2 != null) ...[
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: onTapAction2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16),
                  child: LoadingImage(
                    boxfit: BoxFit.contain,
                    image:
                        // isActionShare ?
                        //  AppIcons.shareIcon :
                        actionIcon2,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
            ],
            if (actionTitle != null && onTapActionTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: onTapActionTitle,
                  child: Row(
                    children: [
                      CustomTextWidget(
                        text: actionTitle ?? "",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kDarkTextColor,
                        ),
                      ),
                      // AppStyle.gap,
                    ],
                  ),
                ),
              ),
          ],
          bottom: bottomWidget != null
              ? PreferredSize(
                  preferredSize: Size.fromHeight(bottomHeight),
                  child: Stack(children: [bottomWidget!]),
                )
              : null,
        ),
      ),
    );
  }
}
