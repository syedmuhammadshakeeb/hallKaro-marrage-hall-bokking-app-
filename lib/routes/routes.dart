// import 'package:flutter/material.dart';

// import '../app/my_app.dart';
// import 'routes_name.dart';

// PageRoute getPageRoute(Widget child, {PageTransitionType? transitionType}) {
//   return PageTransition(
//     child: child,
//     type: transitionType ?? PageTransitionType.rightToLeft,
//     duration: const Duration(milliseconds: 300),
//     reverseDuration: const Duration(milliseconds: 300),
//     isIos: true,
//     alignment: Alignment.center,
//   );
// }

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RoutesName.splash:
//         return getPageRoute(const SplashScreen());
//       case RoutesName.main:
//         return getPageRoute(const MainScreen());
//       case RoutesName.welcome:
//         return getPageRoute(const WelcomeScreen());
//       case RoutesName.login:
//         return getPageRoute(const LoginScreen());
//       case RoutesName.verifyOtp:
//         OtpScreenArgument args = settings.arguments as OtpScreenArgument;

//         return getPageRoute(
//           OtpScreen(
//             isFromCampApplication: args.isFromCampApplication,
//             phone: args.phone,
//             cpr: args.cpr,
//             campType: args.campType,
//           ),
//         );
//       case RoutesName.signupInstructions:
//         return getPageRoute(const SignupInstructionScreen());
//       case RoutesName.signupCprReader:
//         return getPageRoute(const SignupCprReaderScreen());
//       case RoutesName.signupForm:
//         SignupFormScreenArguments args =
//             settings.arguments as SignupFormScreenArguments;
//         return getPageRoute(
//           SignupFormScreen(
//             cprData:
//                 // CPRDataModel(
//                 //   cprNumber: '111111111',
//                 //   fullName: 'ali',
//                 //   personalNumber: '11111111',
//                 //   nationality: 'Bahraini',
//                 //   gender: 'male',
//                 //   birthDate: DateTime.now().subtract(Duration(days: 365 * 20)),
//                 //   expirationDate: DateTime.now().add(Duration(days: 365 * 20)),
//                 //   frontImage: args.cprData?.frontImage,
//                 //   backImage: args.cprData?.backImage,
//                 // ),
//                 args.cprData,
//           ),
//         );
//       case RoutesName.newsDetail:
//         NewsDetailArguments args = settings.arguments as NewsDetailArguments;
//         return getPageRoute(NewsDetailScreen(newsId: args.newsId));
//       case RoutesName.eventDetail:
//         EventDetailScreenArgs args =
//             settings.arguments as EventDetailScreenArgs;
//         return getPageRoute(EventDetailScreen(eventId: args.eventId));
//       case RoutesName.projectDetail:
//         ProjectDetailScreenArgument args =
//             settings.arguments as ProjectDetailScreenArgument;
//         return getPageRoute(ProjectDetailScreen(projectId: args.projectId));
//       case RoutesName.account:
//         return getPageRoute(const AccountScreen());
//       case RoutesName.profile:
//         return getPageRoute(const ProfileScreen());
//       case RoutesName.myRequest:
//         return getPageRoute(const MyApplicationsScreen());
//       case RoutesName.myAppointment:
//         return getPageRoute(const MyAppointmentScreen());
//       case RoutesName.notification:
//         return getPageRoute(const NotificationScreen());
//       case RoutesName.settings:
//         return getPageRoute(const SettingsScreen());
//       case RoutesName.opinion:
//         return getPageRoute(const OpinionScreen());
//       case RoutesName.podcast:
//         return getPageRoute(const PodcastScreen());
//       case RoutesName.governmentApps:
//         return getPageRoute(const GovernmentAppsScreen());
//       case RoutesName.about:
//         return getPageRoute(const AboutScreen());
//       case RoutesName.videoCallCatagory:
//         return getPageRoute(const VideoCallCatagoryScreen());
//       case RoutesName.videoCallForm:
//         VideoCallFormScreenArgument args =
//             settings.arguments as VideoCallFormScreenArgument;
//         return getPageRoute(
//           VideoCallFormScreen(
//             serviceId: args.serviceId,
//             subServiceId: args.subServiceId,
//           ),
//         );
//       case RoutesName.emergencyNumber:
//         return getPageRoute(const EmergencyContactsScreen());
//       case RoutesName.weeklyCouncil:
//         return getPageRoute(const WeeklyCouncilScreen());
//       case RoutesName.weeklyCouncilDetail:
//         WeeklyCouncilDetailArguments args =
//             settings.arguments as WeeklyCouncilDetailArguments;
//         return getPageRoute(
//           WeeklyCouncilDetailScreen(weeklyCouncilId: args.weeklyCouncilId),
//         );
//       case RoutesName.customPageForm:
//         CustomPageFormScreenArguments args =
//             settings.arguments as CustomPageFormScreenArguments;
//         return getPageRoute(
//           CustomPageFormScreen(customPageData: args.customPageData),
//         );
//       case RoutesName.searchLocation:
//         SearchLocationMapScreenArgs args =
//             settings.arguments as SearchLocationMapScreenArgs;
//         return getPageRoute(SearchLocationMapScreen(onTapSave: args.onTapSave));

//       case RoutesName.deliverToYouForm:
//         return getPageRoute(const DeliverToYouScreen());

//       case RoutesName.campInfo:
//         return getPageRoute(const CampInfoScreen());
//       case RoutesName.seasonalMap:
//         return getPageRoute(const SeasonalMapSceen());
//       case RoutesName.volunteerApplication:
//         return getPageRoute(const VolunteerApplicationScreen());
//       case RoutesName.termsAndConsidition:
//         TermsAndConitionScreenArgument args =
//             settings.arguments as TermsAndConitionScreenArgument;
//         return getPageRoute(
//           TermsAndConditionScreen(
//             isFromSeasonRequirement: args.isFromSeasonRequirement,
//           ),
//         );
//       case RoutesName.typeOfCamp:
//         return getPageRoute(const CampTypeScreen());
//       case RoutesName.campApplicationPhase1:
//         return getPageRoute(const CampApplicationPhase1Screen());
//       case RoutesName.verifyIdentity:
//         return getPageRoute(const VerifyIdentityScreen());
//       case RoutesName.campApplicationPhase2:
//         return getPageRoute(CampApplicationPhase2Screen());
//       case RoutesName.documentPreview:
//         DocumentPreviewScreenArgument args =
//             settings.arguments as DocumentPreviewScreenArgument;
//         return getPageRoute(DocumentPreviewScreen(attachment: args.attachment));
//       case RoutesName.success:
//         SucessScreenArgument args = settings.arguments as SucessScreenArgument;
//         return getPageRoute(
//           SucessScreen(
//             headerText: args.headerText,
//             image: args.image,
//             subHeaderText: args.subHeaderText,
//             imageHeight: args.imageHeight,
//             imageWidth: args.imageWidth,
//           ),
//         );
     

//       // case RoutesName.login:
//       //   return getPageRoute(LoginScreen());

//       // case RoutesName.verifyOtp:
//       //   VerifyOtpArguments args = settings.arguments as VerifyOtpArguments;

//       //   return getPageRoute(
//       //     VerifyOtpScreen(
//       //       countryId: args.countryId,
//       //       phone: args.phone,
//       //       email: args.email,
//       //       isForgotPassword: args.isForgotPassword,
//       //     ),
//       //   );

//       default:
//         return DeepLinkService.handleDeepLinkRoutes(context: globalContext);
//       // return getPageRoute(const WelcomeScreen());
//     }
//   }
// }
