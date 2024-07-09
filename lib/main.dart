import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softbd_task/routes/routes.dart';
import 'package:softbd_task/routes/routes_name.dart';
import 'package:softbd_task/utils/app_color.dart';
import 'package:softbd_task/utils/app_constants.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.getDashboardScreen(),
      getPages: AppRoutes.appRoutes(),
      defaultTransition: Transition.topLevel,
    );
  }
}
