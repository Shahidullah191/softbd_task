import 'package:get/get.dart';
import 'package:softbd_task/features/dashboard/screens/dashboard_screen.dart';
import 'package:softbd_task/features/home/screens/home_screen.dart';
import 'package:softbd_task/features/pick_camera/screen/pick_camera_screen.dart';
import 'package:softbd_task/features/profile/screen/profile_screen.dart';
import 'package:softbd_task/features/schedule_menu/screen/schedule_menu_screen.dart';
import 'package:softbd_task/features/timeline/screen/new_add_screen.dart';
import 'package:softbd_task/features/timeline/screen/timeline_screen.dart';
import 'package:softbd_task/routes/routes_name.dart';

class AppRoutes {
  static appRoutes() => [

    GetPage(
      name: RoutesName.dashboardScreen,
      page: () => const DashboardScreen(pageIndex: 0),
    ),

    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
    ),

    GetPage(
      name: RoutesName.timelineScreen,
      page: () => const TimeLineScreen(),
    ),

    GetPage(
      name: RoutesName.pickCameraScreen,
      page: () => const PickCameraScreen(),
    ),

    GetPage(
      name: RoutesName.scheduleMenuScreen,
      page: () => const ScheduleMenuScreen(),
    ),

    GetPage(
      name: RoutesName.profileScreen,
      page: () => const ProfileScreen(),
    ),

    GetPage(
      name: RoutesName.newAddScreen,
      page: () => const NewAddScreen(),
    ),

  ];
}
