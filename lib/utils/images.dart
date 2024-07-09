class Images {
  const Images._();

  static String get govtLogo => 'govt_logo'.png;


}


extension on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
}