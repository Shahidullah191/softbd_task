import 'package:get/get.dart';
import 'package:softbd_task/features/home/screens/home_screen.dart';
import 'package:softbd_task/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
    ),

  ];
}
