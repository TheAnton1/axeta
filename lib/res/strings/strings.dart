abstract class Strings {
  static const errorFetchingData = "Error getting data";
  static const done = "Done";
  static const experience = "Experience";
  static const portfolio = "Portfolio";
  static const availability = "Availability";
  static const environment = "Preferred environment";
  static const quote1 = "The most amazing...";
  static const quote2 = "In clients I look for...";
  static const specialSymbols = 'Should not contain special symbols';

  static years(int? years) => (years != null) ? '$years years' : 'years';
}
