import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tracker/features/home/screens/details_screen.dart';
import 'package:tracker/features/home/services/expenses_cubit.dart';
import 'package:tracker/features/home/services/local_storage.dart';
import '../services/expenses_state.dart';
import '../widgets/cascading_card_widget.dart';
import '../widgets/info_card.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YearlyExpenseCubit(FirebaseFirestore.instance, FirebaseAuth.instance.currentUser!.uid,LocalCacheService())
        ..fetchYearlyExpense(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<YearlyExpenseCubit, YearlyExpenseState>(
          builder: (context, state) {
            if (state is YearlyExpenseLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is YearlyExpenseError) {
              return Center(
                child: Text(state.error),
              );
            } else if (state is YearlyExpenseLoaded) {
              var yearlyExpenses = state.yearlyExpense.years;
              var currentYearExpenses = yearlyExpenses[DateTime.now().year.toString()];
              if (currentYearExpenses == null) {
                return const Center(child: Text('No data for this year'));
              }
              DateTime now = DateTime.now();
              DateFormat monthNameFormat = DateFormat('MMM');
              String monthName = monthNameFormat.format(now);
              var monthlyExpenses = currentYearExpenses.months[monthName.toLowerCase()];

              return SingleChildScrollView(
                child: Column(
                  children: [
                    CascadingCardWidget(expense: monthlyExpenses!),
                    SizedBox(height: 10.h),
                    InfoCard(
                      imageIcon: Image.asset(
                        'lib/assets/house.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                      iconBackgroundColor: Colors.deepOrangeAccent.shade200,
                      title: 'RENT/LOAN',
                      percentage: '${(monthlyExpenses.rent*100/monthlyExpenses.total).round()}%',
                      money: '-\$${monthlyExpenses.rent}',
                    ),
                    InfoCard(
                      imageIcon: Image.asset('lib/assets/lightbulb.png', width: 24.w, height: 24.h),
                      iconBackgroundColor: Colors.blue[600]!,
                      title: 'UTILITIES',
                      percentage: '${(monthlyExpenses.util*100/monthlyExpenses.total).round()}%',
                      money: '-\$${monthlyExpenses.util}',
                    ),
                    InfoCard(
                      imageIcon: Image.asset('lib/assets/polo.png', width: 24.w, height: 24.h),
                      iconBackgroundColor: Colors.tealAccent.shade700,
                      title: 'CLOTHING',
                      percentage: '${(monthlyExpenses.clothes*100/monthlyExpenses.total).round()}%',
                      money: '-\$${monthlyExpenses.clothes}',
                    ),
                    InfoCard(
                      imageIcon: Image.asset('lib/assets/sedan.png', width: 24.w, height: 24.h),
                      iconBackgroundColor: Colors.yellow.shade700,
                      title: 'CAR',
                      percentage: '${(monthlyExpenses.car*100/monthlyExpenses.total).round()}%',
                      money: '-\$${monthlyExpenses.car}',
                    ),
                    InfoCard(
                      imageIcon: Image.asset('lib/assets/burger.png', width: 24.w, height: 24.h),
                      iconBackgroundColor: Colors.deepPurple,
                      title: 'EATING OUT',
                      percentage: '${(monthlyExpenses.eat*100/monthlyExpenses.total).round()}%',
                      money: '-\$${monthlyExpenses.eat}',
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 12.h,
                          ),
                          minimumSize: Size(double.infinity, 50.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Show Details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Unexpected State'));
            }
          },
        ),
      ),
    );
  }
}
