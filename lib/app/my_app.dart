import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hall_karo/bloc_provider_list.dart';
import 'package:hall_karo/routes/routes.dart';
import 'package:hall_karo/routes/routes_name.dart';
import 'package:hall_karo/theme/theme.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
BuildContext globalContext = navigatorKey.currentContext!;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: BlocProviderList.allBlocProviders,
      child: KeyboardDismisser(
        child: DevicePreview(
          enabled: false,
          builder: (context) {
            return MaterialApp(
              title: 'Southern Governorate',
              debugShowCheckedModeBanner: false,
              // ignore: deprecated_member_use
              useInheritedMediaQuery: true,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorKey: navigatorKey,
              theme: AppTheme(context).lightTheme,
              initialRoute: RoutesName.splash,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        ),
      ),
    );
  }
}