
import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/component/button/custom_button.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';

// import 'package:kashta_tours_app/components/button/custom_button.dart';
// import 'package:kashta_tours_app/components/text/custom_text.dart';
// import 'package:kashta_tours_app/utils/constants/color.dart';
// import 'package:kashta_tours_app/utils/constants/text_styles.dart';

class LoadMoreButton extends StatelessWidget {
  final Function()? onTap;
  final bool isLoading;
  final double? paddingBottom;

  const LoadMoreButton({
    super.key,
    this.onTap,
    this.isLoading = false,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom ?? 4),
      child: CustomButtonWidget(
        // width: 50,
        widthFactor: .45,
        backgroundColor: AppColors.kPrimary,
        // borderColor: AppColors.kSecondaryTextColor,
        borderRadius: 50,
        onTap: onTap,
        loading: isLoading,
        text: "Load more",
      ),
    );
  }
}
