import 'package:fl_base/base/base_controller.dart';
import 'package:fl_base/page/splash/splash_page.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerDashBoard = '/dashBoard';

  static const String routerHome = '/home';
  static const String routerNotFoundURL = '/routerNotFoundURL';

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<SplashPage>(
      name: routerSplash,
      page: () => SplashPage(),
    ),
  ];
}
