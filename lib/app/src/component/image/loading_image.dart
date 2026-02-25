import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hall_karo/app/src/utils/constant/color.dart';
import 'package:hall_karo/app/src/utils/constant/images.dart';
import 'package:hall_karo/app/src/utils/functions/string_functions.dart';
import 'package:skeleton_text/skeleton_text.dart';


class LoadingImage extends StatelessWidget {
  final String? image;
  final File? fileImage; // Added this field for supporting local file path
  final BoxFit? boxfit;
  final double? width, height, skeletonBorderRadius;
  final Color? color;
  final FilterQuality filterquality;
  final BorderRadius? borderRadius;

  const LoadingImage(
      {super.key,
      this.image,
      this.fileImage, // Accept file image as a parameter
      this.boxfit,
      this.height,
      this.width,
      this.color,
      this.borderRadius,
      this.skeletonBorderRadius,
      this.filterquality = FilterQuality.high});

  static bool isServerImage(String? imagePath) {
    return imagePath != null &&
        (imagePath.startsWith('http://') || imagePath.startsWith('https://'));
  }

  @override
  Widget build(BuildContext context) {
    bool isSvgImage(String imageUrl) {
      return imageUrl.toLowerCase().endsWith('.svg');
    }

    log("image===>${image}");
    // If we have a file image, display it using Image.file
    if (fileImage != null) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.file(
          fileImage!,
          fit: boxfit ?? BoxFit.fill,
          width: width,
          height: height,
          color: color,
          filterQuality: filterquality,
        ),
      );
    }

    if ((!isServerImage(image)) && StringFunctions.isValuNoteNullAndNotEmpty(image)) {
      if (isSvgImage(image ?? "")) {
        return SvgPicture.asset(
          image ?? "",
          width: width,
          height: height,
          fit: boxfit ?? BoxFit.fill,
          color: color,
        );
      } else {
        return Image.asset(
          image ?? "",
          width: width,
          height: height,
          fit: boxfit ?? BoxFit.fill,
          color: color,
        );
      }
    }

    if (isSvgImage(image ?? "")) {
      return SvgPicture.network(
        image ?? "",
        placeholderBuilder: (BuildContext context) => Image.asset(
          AppImages.empty,
           width: width,
          height: height,
          fit: BoxFit.contain,
        ),
        width: width,
        height: height,
        fit: boxfit ?? BoxFit.fill,
        color: color,
      );
    }

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: image ?? "",
        imageBuilder: (context, imageProvider) {
          return Image(
            image: imageProvider,
            filterQuality: filterquality,
            fit: boxfit ?? BoxFit.fill,
            color: color,
            width: width,
            height: height,
          );
        },
        errorListener: (value) {
          // log('loading image error: $value=>${AppIcons.errorIcon}');
        },
        placeholder: (context, url) => SizedBox(
          width: width,
          height: height,
          child: SkeletonAnimation(
            borderRadius:
                BorderRadius.all(Radius.circular(skeletonBorderRadius ?? 8)),
            shimmerColor: AppColors.kGrey20,
            shimmerDuration: 1000,
            curve: Curves.decelerate,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.kGrey10,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          AppImages.empty,
           width: width,
          height: height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
