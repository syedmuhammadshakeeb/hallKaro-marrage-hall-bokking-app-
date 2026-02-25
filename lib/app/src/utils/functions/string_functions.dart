import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/utils/constant/images.dart';


class StringFunctions {
  static String convertHtmlToText(String htmlText) {
    // Remove all HTML tags
    String plainText = htmlText.replaceAll(RegExp(r'<[^>]*>'), '');

    // Decode common HTML entities (extend this list as needed)
    Map<String, String> htmlEntities = {
      '&amp;': '&',
      '&lt;': '<',
      '&gt;': '>',
      '&quot;': '"',
      '&#39;': "'",
      '&nbsp;': ' ',
      '&copy;': '©',
      '&reg;': '®',
      '&euro;': '€',
      '&pound;': '£',
      '&yen;': '¥',
      '&cent;': '¢',
      '&raquo;': '»',
      '&laquo;': '«',
      '&#8230;': '…',
    };

    htmlEntities.forEach((entity, char) {
      plainText = plainText.replaceAll(entity, char);
    });

    // Remove any CDATA markers
    plainText = plainText.replaceAll(RegExp(r'<!\[CDATA\[|\]\]>'), '');

    // Replace all newline and multiple spaces with a single space
    plainText = plainText.replaceAll(RegExp(r'\s+'), ' ').trim();

    return plainText;
  }

  static bool isSameString(String? s1, String? s2) {
    if (s1?.toUpperCase() == s2?.toUpperCase()) {
      return true;
    }
    return false;
  }

  static bool isValuNoteNullAndNotEmpty(String? val) {
    log("val=====>$val");
    // log("calue==>$val");
    if (val != null && val.isNotEmpty == true) {
      return true;
    }
    return false;
  }

  bool isValuNullOrEmpty(String? val) {
    log("val=====>$val");
    // log("calue==>$val");
    if (val == null || val.trim().isEmpty == true) {
      return true;
    }
    return false;
  }

  //

  
  ImageProvider getImageProvider(String? image, {bool? hasError}) {
    if (hasError == true || image == null || image.isEmpty == true) {
      return const AssetImage(AppImages.empty);
    }
    return NetworkImage(image);
  }

  // static Widget htmlMarkupWidget(
  //   String? value,
  //   BuildContext context, {
  //   Map<String, String>? customStyle,
  // }) {
  //   // log("value==>${removeUnderlineTags(markdownToHtml(value ?? ''))}");

  //   String cleanedValue =
  //       value?.replaceAllMapped(
  //         RegExp(r'\*\*(.*?)\*\*'),
  //         (match) => '<strong>${match.group(1)}</strong>',
  //       ) ??
  //       '';

  //   Widget markupWidget = HtmlWidget(
  //     removeUnderlineTags(markdownToHtml(cleanedValue)),
  //     customStylesBuilder: (element) {
  //       if (customStyle == null) {
  //         if (element.localName == 'h4') {
  //           return {
  //             'font-size': '26px',
  //             'font-weight': '700',
  //             'word-spacing': '50px',
  //             'letter-spacing': '24px',
  //             'color': '#898D8F',
  //           };
  //         }

  //         if (element.localName == 'h3') {
  //           return {
  //             'font-size': '20px',
  //             'font-weight': '600',
  //             'word-spacing': '50px',
  //             'letter-spacing': '24px',

  //             'color': '#898D8F',
  //           };
  //         }
  //         if (element.localName == 'p') {
  //           return {
  //             'font-size': '16px',
  //             'font-weight': '400',
  //             'line-height': '24px',
  //             'word-spacing': '50px',
  //             'letter-spacing': '24px',

  //             'color': '#898D8F',
  //           };
  //         }
  //         if (element.localName == 'a') {
  //           return {
  //             'font-size': '16px',
  //             'font-weight': '400',
  //             'line-height': '24px',
  //             'word-spacing': '50px',
  //             'letter-spacing': '24px',

  //             'color': '#898D8F',
  //             'text-decoration': 'none',
  //             // 'border-bottom': '1px solid red'
  //           };
  //         }
  //         if (element.localName == 'li') {
  //           return {
  //             'font-size': '16px',
  //             'font-weight': '400',
  //             'line-height': '24px',
  //             'word-spacing': '50px',
  //             'letter-spacing': '24px',
  //             'color': '#898D8F',
  //           };
  //         }
  //         if (element.localName == 'span') {
  //           return {'color': '#000000', 'font-weight': '400'};
  //         }
  //       }

  //       return customStyle ?? {};
  //     },
  //   );

  //   return markupWidget;
  // }

  static String removeUnderlineTags(String html) {
    return html.replaceAll(RegExp(r'</?u>'), '');
  }
}
