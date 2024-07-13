String convertToBanglaNumeral(int number) {
  const List<String> banglaNumerals = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
  return number.toString().split('').map((digit) => banglaNumerals[int.parse(digit)]).join();
}