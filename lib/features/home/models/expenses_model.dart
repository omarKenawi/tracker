class Expense {
  final int car;
  final int cash;
  final int clothes;
  final int dept;
  final int earned;
  final int eat;
  final int rent;
  final int total;
  final int util;

  Expense({
    required this.car,
    required this.cash,
    required this.clothes,
    required this.dept,
    required this.earned,
    required this.eat,
    required this.rent,
    required this.total,
    required this.util,
  });

  factory Expense.fromMap(Map<String, dynamic> data) {
    return Expense(
      car: data['car'],
      cash: data['cash'],
      clothes: data['clothes'],
      dept: data['dept'],
      earned: data['earned'],
      eat: data['eat'],
      rent: data['rent'],
      total: data['total'],
      util: data['util'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'car': car,
      'cash': cash,
      'clothes': clothes,
      'dept': dept,
      'earned': earned,
      'eat': eat,
      'rent': rent,
      'total': total,
      'util': util,
    };
  }
}

class MonthlyExpense {
  final Map<String, Expense> months;

  MonthlyExpense({required this.months});

  factory MonthlyExpense.fromMap(Map<String, dynamic> data) {
    final Map<String, Expense> months = {};
    data.forEach((month, expenseData) {
      months[month] = Expense.fromMap(expenseData);
    });
    return MonthlyExpense(months: months);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    months.forEach((month, expense) {
      data[month] = expense.toMap();
    });
    return data;
  }
}

class YearlyExpense {
  final Map<String, MonthlyExpense> years;

  YearlyExpense({required this.years});

  factory YearlyExpense.fromMap(Map<String, dynamic> data) {
    final Map<String, MonthlyExpense> years = {};
    data.forEach((year, monthlyData) {
      years[year] = MonthlyExpense.fromMap(monthlyData);
    });
    return YearlyExpense(years: years);
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    years.forEach((year, monthlyExpense) {
      data[year] = monthlyExpense.toMap();
    });
    return data;
  }
}
