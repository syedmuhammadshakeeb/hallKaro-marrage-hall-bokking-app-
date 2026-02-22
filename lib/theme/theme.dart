// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../app/src/core/constants/color.dart';
// import 'typography.dart';

// class AppTheme {
//   final ThemeData lightTheme;
//   final ThemeData darkTheme;
//   AppTheme(BuildContext context)
//       : lightTheme = _buildLightTheme(context),
//         darkTheme = _buildDarkTheme();
//   static ThemeData _buildDarkTheme() {
//     return ThemeData(
//         // useMateriedRectangleBorder(
//         //     borderRadius: BorderRadius.circular(10),
//         //   ),
//         //   elevation: 0,
//         //   alignment: Alignment.center,
//         // ),
//         // scaffoldBackgral3: false,
//         // colorScheme: const ColorScheme.dark().copyWith(
//         //   primary: ColorConstant.mainRedEA2F28,
//         //   secondary: ColorConstant.whiteClr,
//         // ),
//         // inputDecorationTheme: InputDecorationTheme(
//         //   errorBorder: OutlineInputBorder(
//         //     borderRadius: BorderRadius.circular(8),
//         //     borderSide:
//         //         BorderSide(color: ColorConstant.mainRedEA2F28, width: 1.0),
//         //   ),
//         //   focusedErrorBorder: OutlineInputBorder(
//         //     borderRadius: BorderRadius.circular(8),
//         //     borderSide:
//         //         BorderSide(color: ColorConstant.mainRedEA2F28, width: 1.0),
//         //   ),
//         // ),
//         // dialogTheme: DialogTheme(
//         //   backgroundColor: ColorConstant.blackClr,
//         //   shape: RoundoundColor: ColorConstant.blackClr,
//         // appBarTheme: AppBarTheme(
//         //   elevation: 0,
//         //   backgroundColor: ColorConstant.blackClr,
//         //   titleTextStyle: TextStyle(color: ColorConstant.whiteClr),
//         //   systemOverlayStyle: const SystemUiOverlayStyle(
//         //     statusBarColor: Colors.transparent,
//         //     statusBarIconBrightness: Brightness.light,
//         //     statusBarBrightness: Brightness.dark,
//         //   ),
//         // ),
//         // pageTransitionsTheme: const PageTransitionsTheme(
//         //   builders: {
//         //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//         //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//         //   },
//         // ),
//         // fontFamily: 'PlusJakartaSans',
//         // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         //   backgroundColor: Colors.black45,
//         //   showUnselectedLabels: true,
//         //   showSelectedLabels: true,
//         //   type: BottomNavigationBarType.fixed,
//         //   unselectedLabelStyle: AppStyle.txt12white600,
//         //   selectedLabelStyle: AppStyle.txt12Red700,
//         //   selectedIconTheme:
//         //       IconThemeData(color: ColorConstant.mainRedEA2F28, size: 12),
//         //   unselectedIconTheme:
//         //       IconThemeData(color: ColorConstant.whiteClr, size: 12),
//         // ),
//         // brightness: Brightness.dark,
//         );
//   }

//   static ThemeData _buildLightTheme(BuildContext context) {
//     return ThemeData(
//       useMaterial3: false,
//       scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
//       textSelectionTheme: const TextSelectionThemeData(
//         cursorColor: AppColors.kPrimary,
//         // selectionColor: Colors.green,
//         selectionHandleColor: AppColors.kPrimary,
//       ),
//       textTheme: getTextTheme(
//         context,
//         AppColors.kGrey70,
//         AppColors.kLighterGreyTextColor,
//       ),
//       // colorScheme: const ColorScheme.light().copyWith(
//       //     primary: AppColors.scaffoldBackgroundColor,
//       //     secondary: AppColors.scaffoldBackgroundColor),

//       appBarTheme: const AppBarTheme(
//         titleTextStyle: TextStyle(
//           color: AppColors.kDarkTextColor,
//         ),
//         // color: AppColors.kBlack,
//         backgroundColor: AppColors.scaffoldBackgroundColor,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           systemNavigationBarIconBrightness: Brightness.dark,
//           statusBarColor: Colors.transparent,
//           statusBarIconBrightness: Brightness.dark,
//           statusBarBrightness: Brightness.light,
//           systemNavigationBarColor: AppColors.scaffoldBackgroundColor,
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         // b
//         // cursorColor: Colors.white
//         filled: true,
//         prefixIconColor: AppColors.kdarkgrey28,
//         hintStyle: const TextStyle(
//           color: AppColors.kLightGreyTextColor,
//         ),
//         fillColor: AppColors.kWhite,

//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             8.0,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             8.0,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(
//             8.0,
//           ),
//         ),
//       ),
//       tabBarTheme: const TabBarThemeData(
//           unselectedLabelColor: AppColors.kLightGreyTextColor,
//           labelColor: AppColors.kPrimary,
//           dividerColor: AppColors.kLightGreyBgColor,
//           labelStyle: TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w500,
//           ),
//           // dividerHeight: 0,
//           // labelPadding: EdgeInsets.all(0),

//           unselectedLabelStyle: TextStyle(
//             fontSize: 13,
//           ),
//           overlayColor: WidgetStatePropertyAll(
//             AppColors.scaffoldBackgroundColor,
//           ),
//           indicatorColor: AppColors.kPrimary,
//           indicatorSize: TabBarIndicatorSize.tab
//           // unselectedLabelStyle:
//           //    selectedItemColor: AppColors.kPrimary,
//           // unselectedItemColor: AppColors.kLightGreyTextColor,

//           ),

// //bottomsheet
//       bottomSheetTheme: const BottomSheetThemeData(
//         backgroundColor: AppColors.scaffoldBackgroundColor,
//         surfaceTintColor: AppColors.scaffoldBackgroundColor,
//         dragHandleColor: AppColors.kDarkGreyTextColor,
//         dragHandleSize: Size(
//           50,
//           5,
//         ),
//       ),
//       checkboxTheme: const CheckboxThemeData(
//         side: BorderSide(
//           color: AppColors.kDarkGreyTextColor,
//         ),
//       ),
//       // dialogTheme: DialogTheme(
//       //   backgroundColor: ColorConstant.whiteClr,
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(10),
//       //   ),,
//       //   elevation: 0,
//       //   alignment: Alignment.center,
//       // ),
//       // scaffoldBackgroundColor: ColorConstant.whiteColorF5F5F5,
//       // pageTransitionsTheme: const PageTransitionsTheme(
//       //   builders: {
//       //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//       //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//       //   },
//       // ),
//       // expansionTileTheme: ExpansionTileThemeData(
//       //   backgroundColor: AppColors.kLightGreyBgColor.withOpacity(0.1),
//       //   collapsedBackgroundColor: AppColors.kLightGreyBgColor.withOpacity(0.1),
//       //   collapsedIconColor: AppColors.kPrimaryDark,
//       //   childrenPadding:
//       //       const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
//       //   iconColor: AppColors.kPrimaryDark,
//       //   shape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(12.0),
//       //   ),
//       //   collapsedShape: RoundedRectangleBorder(
//       //     borderRadius: BorderRadius.circular(12.0),
//       //   ),
//       // ),
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         elevation: 0,
//         backgroundColor: AppColors.kWhite,
//         showUnselectedLabels: true,
//         showSelectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: AppColors.kPrimary,
//         unselectedItemColor: AppColors.kLightGreyTextColor,
//         selectedLabelStyle: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w600,
//           color: AppColors.kPrimaryDarkTextColor,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w400,
//         ),
//         selectedIconTheme: IconThemeData(
//           color: AppColors.kPrimary,
//           size: 12,
//         ),
//         unselectedIconTheme: IconThemeData(
//           color: AppColors.kPrimaryDarkTextColor,
//           size: 12,
//         ),
//       ),
//       // brightness: Brightness.light,
//       // appBarTheme: AppBarTheme(
//       //   elevation: 0,
//       //   backgroundColor: ColorConstant.whiteClr,
//       //   titleTextStyle: TextStyle(
//       //     color: ColorConstant.blackClr,
//       //     fontFamily: 'PlusJakartaSans',
//       //   ),
//       // systemOverlayStyle: const SystemUiOverlayStyle(
//       //   statusBarColor: Colors.transparent,
//       //   statusBarIconBrightness: Brightness.dark,
//       //   statusBarBrightness: Brightness.light,
//       // ),
//       // ),
//       // fontFamily: 'PlusJakartaSans',
//     );
//   }
// }
