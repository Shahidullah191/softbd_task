class Images {
  const Images._();

  static String get cameraIcon => 'camera_icon'.png;
  static String get demoIcon => 'demo_icon'.png;
  static String get notificationIcon => 'notification_icon'.png;
  static String get menuNo01 => 'menu_no_01'.png;
  static String get menuNo02 => 'menu_no_02'.png;
  static String get menuNo03 => 'menu_no_03'.png;
  static String get menuNo04 => 'menu_no_04'.png;
  static String get menuNo05 => 'menu_no_05'.png;
  static String get menuNo06 => 'menu_no_06'.png;
  static String get menAvatar => 'men_avatar'.png;
  static String get locationIcon => 'location_icon'.png;
  static String get checkMarkIcon => 'check_mark_icon'.png;
  static String get homeUnselectedIcon => 'home_unselected'.png;
  static String get calenderUnselectedIcon => 'calender_unselected'.png;
  static String get scheduleMenuUnselectedIcon => 'schedule_menu_unselected'.png;
  static String get profileUnselectedIcon => 'profile_unselected'.png;


}


extension on String {
  String get png => 'assets/images/$this.png';
}