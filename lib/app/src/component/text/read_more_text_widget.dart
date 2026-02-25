
import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/component/text/custom_text.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';


class ReadMoreTextWidget extends StatefulWidget {
  final String? text;
  final TextStyle? style;
  final int trimLines;

  const ReadMoreTextWidget({
    super.key,
    this.text,
    this.style,
    this.trimLines = 3,
  });

  @override
  _ReadMoreTextWidgetState createState() => _ReadMoreTextWidgetState();
}

class _ReadMoreTextWidgetState extends State<ReadMoreTextWidget> {
  ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);
  bool isOverflowing = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        // Create TextSpan to measure text overflow
        final span = TextSpan(text: widget.text, style: widget.style);
        final tp = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: size.maxWidth);

        isOverflowing = tp.didExceedMaxLines;

        return ValueListenableBuilder<bool>(
          valueListenable: isExpanded,
          builder: (context, expanded, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: widget.text ?? "",
                  style: widget.style,
                  maxLines: expanded ? null : widget.trimLines,
                  overflow: TextOverflow.fade,
                ),
                if (isOverflowing)
                  GestureDetector(
                    onTap: () {
                      isExpanded.value = !expanded;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        expanded ? "Show less" : "Show more",
                        style: widget.style?.copyWith(
                          color: AppColors.kPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
