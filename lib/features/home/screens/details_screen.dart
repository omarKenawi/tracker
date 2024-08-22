import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../services/expenses_cubit.dart';
import '../services/expenses_state.dart';
import '../services/local_storage.dart';
import '../widgets/budget_progress.dart';
import '../widgets/cash_flow_widget.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/financial_row.dart';
import '../widgets/pie_chart_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;


    return BlocProvider(
      create: (context) => YearlyExpenseCubit(
          FirebaseFirestore.instance, user!.uid, LocalCacheService())
        ..fetchYearlyExpense(),
      child: BlocBuilder<YearlyExpenseCubit, YearlyExpenseState>(
        builder: (context, state) {
          if (state is YearlyExpenseLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is YearlyExpenseLoaded) {
            var yearlyExpenses = state.yearlyExpense.years;
            var currentYearExpenses =
                yearlyExpenses[DateTime.now().year.toString()];
            DateTime now = DateTime.now();
            DateFormat monthNameFormat = DateFormat('MMM');
            String monthName = monthNameFormat.format(now);
            var monthlyExpenses =
                currentYearExpenses!.months[monthName.toLowerCase()];
            if (monthlyExpenses == null) {
              return const Scaffold(
                body: Center(child: Text('No data for this month')),
              );
            }
            return Scaffold(
              backgroundColor: Colors.white,
              drawer: const CustomDrawer(),
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  'Overview',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: Image.asset(
                      'lib/assets/menu.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ACCOUNTS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          FinancialRow(
                            label: 'Cash',
                            value: '\$${monthlyExpenses.cash}',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                            valueStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                              color: const Color(0xff1951d1),
                            ),
                          ),
                          FinancialRow(
                            label: 'Credit Debt',
                            value: '-\$${monthlyExpenses.dept}',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18.sp,
                              color: Colors.grey,
                            ),
                            valueStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 5.h),
                           BudgetProgress(
                            percentage: .9,
                            month: DateFormat('MMMM').format(DateTime.now()),
                          ),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 5.h),
                          CashFlowWidget(
                            earnedAmount: monthlyExpenses.earned.toInt(),
                            spentAmount: monthlyExpenses.dept.toInt(),
                            earnedProgressWidth: 80.w,
                            spentProgressWidth: 50.w,
                          ),
                          SizedBox(height: 5.h),
                          const Divider(),
                          SizedBox(height: 5.h),
                          PieChartWidget(
                            month: DateFormat('MMMM').format(DateTime.now()),
                            carPercentage: (monthlyExpenses.car*100/monthlyExpenses.total).round(),
                            clothingPercentage: (monthlyExpenses.clothes*100/monthlyExpenses.total).round(),
                            eatingPercentage:(monthlyExpenses.eat*100/monthlyExpenses.total).round() ,
                            homePercentage: (monthlyExpenses.rent*100/monthlyExpenses.total).round(),
                            utilPercentage:(monthlyExpenses.util*100/monthlyExpenses.total).round() ,
                          ),
                          const Divider(),
                          SizedBox(height: 5.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is YearlyExpenseError) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Error: ${state.error}',
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Unexpected state'),
              ),
            );
          }
        },
      ),
    );
  }
}
