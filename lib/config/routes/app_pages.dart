import 'package:get/get.dart';
import 'package:payuung_pribadi/config/routes/app_routes.dart';
import 'package:payuung_pribadi/presentation/pages/auth.dart';
import 'package:payuung_pribadi/presentation/pages/home/home.dart';
import 'package:payuung_pribadi/presentation/pages/home/index.dart';
import 'package:payuung_pribadi/presentation/pages/profile/profile.dart';
import 'package:payuung_pribadi/presentation/pages/profile/profileupdate.dart';
import 'package:payuung_pribadi/presentation/pages/splash.dart';

final appPage = <GetPage>[
  GetPage(
    name: AppRoutes.initialRoute,
    page: () => const SplashPage(),
  ),
  GetPage(
    name: AppRoutes.index,
    page: () => const IndexPage(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const MyHomePage(),
  ),
  GetPage(
    name: AppRoutes.profile,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: AppRoutes.profileupdate,
    page: () => const ProfileupdatePage(),
  ),
  GetPage(
    name: AppRoutes.auth,
    page: () => const AuthPage(),
  ),
];
