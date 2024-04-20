import 'dart:math';

class SalesDataGenerator {
  final Random _random = Random();

  Map<DateTime, double> generateActualSales() {
    final Map<DateTime, double> salesData = {};
    DateTime startDate = DateTime(2024, 4, 22, 8);
    DateTime endDate = DateTime(2024, 5, 4, 18);

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(Duration(hours: 1))) {
      // Skip Sundays
      if (date.weekday == DateTime.sunday) {
        date = date.add(Duration(days: 1));
        continue;
      }
      // Skip non-business hours (before 8 AM or after 6 PM)
      if (date.hour < 8 || date.hour > 18) continue;

      // Randomize meal quantities
      int quantityA = _random.nextInt(10) + 1; // 1-10
      int quantityB = _random.nextInt(10) + 1; // 1-10
      int quantityC = _random.nextInt(10) + 1; // 1-10
      int quantityD = _random.nextInt(10) + 1; // 1-10

      // Compute total price
      double totalPrice =
          quantityA * 20 + quantityB * 25 + quantityC * 25 + quantityD * 30;

      salesData[date] = totalPrice;
    }
    return salesData;
  }
}
