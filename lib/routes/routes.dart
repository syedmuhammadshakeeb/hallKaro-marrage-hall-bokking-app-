import 'package:flutter/material.dart';
import 'package:hall_karo/api/service/deep_link_service/deep_link_service.dart';
import 'package:hall_karo/app/src/features/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../app/my_app.dart';
import 'routes_name.dart';

PageRoute getPageRoute(Widget child, {PageTransitionType? transitionType}) {
  return PageTransition(
    child: child,
    type: transitionType ?? PageTransitionType.rightToLeft,
    duration: const Duration(milliseconds: 300),
    reverseDuration: const Duration(milliseconds: 300),
    isIos: true,
    alignment: Alignment.center,
  );
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return getPageRoute(const SplashScreen());
  
     

      // case RoutesName.login:
      //   return getPageRoute(LoginScreen());

      // case RoutesName.verifyOtp:
      //   VerifyOtpArguments args = settings.arguments as VerifyOtpArguments;

      //   return getPageRoute(
      //     VerifyOtpScreen(
      //       countryId: args.countryId,
      //       phone: args.phone,
      //       email: args.email,
      //       isForgotPassword: args.isForgotPassword,
      //     ),
      //   );

      default:
        return DeepLinkService.handleDeepLinkRoutes(context: globalContext);
      // return getPageRoute(const WelcomeScreen());
    }
  }
}
