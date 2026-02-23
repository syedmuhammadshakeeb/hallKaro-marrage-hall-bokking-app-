// ignore_for_file: control_flow_in_finally

import 'dart:async';
import 'dart:developer';
// import 'package:bba/features/fantasy/private_league/private_league_screen.dart';
// import 'package:bba/features/on_boarding/on_boarding_screen.dart';
// import 'package:bba/main.dart';
import 'package:app_links/app_links.dart';

import 'package:flutter/material.dart';
import 'package:hall_karo/app/src/features/splash/splash_screen.dart';


import '../../../app/my_app.dart';

// import 'package:provider/provider.dart';

// import '../../view_models/app/app_view_model.dart';

class DeepLinkService {
  static String? deepLinkRouteString;

  AppLinks? _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initDeepLinks(BuildContext context) async {
    log("initDeepLinks start");
    _appLinks = AppLinks();
    // Check initial link if app was in cold state (terminated)
    Uri? appLink = await _appLinks?.getInitialLink();
    log("initDeepLinks -> applink: $appLink");
    if (appLink != null) {
      deepLinkRouteString = appLink.toString();

      // ignore: use_build_context_synchronously
      log('initDeepLinks: $deepLinkRouteString ');
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks?.uriLinkStream.listen(
      (uriValue) {
        log('initDeepLinks -> from deep listen: $deepLinkRouteString ');

        deepLinkRouteString = uriValue.toString();
        // handleDeepLinkRoutes(context??);
      },
      onError: (err) {
        log('initDeepLinks -> from deep listen error: $err');
      },
      onDone: () {
        _linkSubscription?.cancel();
      },
    );
  }

  static Future navigateToDeeplinkRoute(context) async {
    // debugPrint( "deepLinkRouteString route from navigateToDeeplinkRoute===>$deepLinkRouteString");
    if (deepLinkRouteString != null) {
      await Navigator.push(context, handleDeepLinkRoutes(context: context));
    }
  }

  static PageRoute handleDeepLinkRoutes({BuildContext? context}) {
    try {
      // debugPrint("deepLinkRouteString route from handleDeepLinkRoutes===>$deepLinkRouteString");
      if (deepLinkRouteString != null) {
        // https://bba.byklabs.com/fantasy-league/join/73619
        final id = getIdFromRoute(deepLinkRouteString);
        log(
          "deep link service -> deep link not null: $deepLinkRouteString \nid: $id\n glocal context==>$globalContext",
        );
        log("finallly of handle");

        // if (deepLinkRouteString?.contains(AppStrings.GYM.toLowerCase()) ??
        //     false) {
        //   deepLinkRouteString = null;
        //   return MaterialPageRoute(builder: (context) => SplashScreen());
        // }
      }
    } catch (e) {
      log("deep link service error -> handleDeepLinkRoutes : $e");
    }

    return MaterialPageRoute(builder: (context) => const SplashScreen()); // N
  }

  static int? getIdFromRoute(String? url) {
    if (url != null) {
      final id = getLastSegmentFromRoute(url);
      if (id != null) {
        return int.parse(id);
      }
    } else {
      return null;
    }
    return null;
  }

  static String? getLastSegmentFromRoute(String? url) {
    if (url != null) {
      final uri = Uri.parse(url);
      final pathSegments = uri.pathSegments;

      final lastSegment = pathSegments.last;
      log("deep link service -> id: $lastSegment");
      return lastSegment;
    } else {
      return null;
    }
  }
}
