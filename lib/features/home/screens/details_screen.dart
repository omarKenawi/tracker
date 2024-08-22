import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/budget_progress.dart';
import '../widgets/cash_flow_widget.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/financial_row.dart';
import '../widgets/pie_chart_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(), // Use the custom drawer
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
                  SizedBox(
                    height: 5.h,
                  ),
                  FinancialRow(
                    label: 'Cash',
                    value: '\$16,875',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                    valueStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color:
                          const Color(0xff1951d1), // This is the correct format
                    ),
                  ),
                  FinancialRow(
                    label: 'Credit Debt',
                    value: '-\$3,250',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                    valueStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color:
                          const Color(0xff000000), // This is the correct format
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.h,
                  ),
                  const BudgetProgress(
                    percentage: .9,
                    month: 'March',
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.h,
                  ),
                  CashFlowWidget(
                    earnedAmount: 8523,
                    spentAmount: 2523,
                    balanceAmount: 6023,
                    earnedProgressWidth: 80.w,
                    spentProgressWidth: 50.w, // Example width for spent bar
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.h,
                  ),
                  PieChartWidget(
                    month: 'March',
                  ),
                  const Divider(),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
