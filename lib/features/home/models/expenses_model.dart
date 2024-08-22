class Expenses {
  int year;
  Map<String, MonthExpenses> months;

  Expenses({
    required this.year,
    required this.months,
  });

  factory Expenses.fromFirestore(Map<String, dynamic> map) {
    return Expenses(
      year: map['year'],
      months: (map['months'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, MonthExpenses.fromFirestore(value)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'months': months.map((key, value) => MapEntry(key, value.toMap())),
    };
  }
}

class MonthExpenses {
  int earned;
  int total;
  int util;
  int car;
  int eat;
  int dept;
  int rent;
  int cash;
  int clothes;

  MonthExpenses({
    required this.earned,
    required this.total,
    required this.util,
    required this.car,
    required this.eat,
    required this.dept,
    required this.rent,
    required this.cash,
    required this.clothes,
  });

  factory MonthExpenses.fromFirestore(Map<String, dynamic> map) {
    return MonthExpenses(
      earned: map['earned'],
      total: map['total'],
      util: map['util'],
      car: map['car'],
      eat: map['eat'],
      dept: map['dept'],
      rent: map['rent'],
      cash: map['cash'],
      clothes: map['clothes'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'earned': earned,
      'total': total,
      'util': util,
      'car': car,
      'eat': eat,
      'dept': dept,
      'rent': rent,
      'cash': cash,
      'clothes': clothes,
    };
  }
}