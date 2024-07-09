class Images {
  const Images._();

  static String get cameraIcon => 'camera_icon'.png;


}


extension on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
}