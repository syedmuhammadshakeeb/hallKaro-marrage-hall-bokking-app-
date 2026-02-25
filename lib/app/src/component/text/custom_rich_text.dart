import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/text_styles.dart';



class CustomRichText extends StatelessWidget {
  final String? text1, text2;
  final TextStyle? textStyle1, textStyle2;
  final Function()? onText2Tap;

  const CustomRichText({
    super.key,
    this.text1,
    this.text2,
    this.textStyle1,
    this.textStyle2,
    this.onText2Tap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onText2Tap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "$text1",
              style: textStyle2 ??
                  AppTextStyles.grey55f13w500
                      .copyWith(fontFamily: "Almarai"),
            ),
            TextSpan(
              text: "${text2 ?? ""}  ",
              style: textStyle1 ??
                  AppTextStyles.grey55f13w500
                      .copyWith(fontFamily: "Almarai"),
            ),
          ],
        ),
      ),
    );
  }
}
