import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/home/screens/details_screen.dart';
import '../widgets/cascading_card_widget.dart';
import '../widgets/info_card.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CascadingCardWidget(),
            SizedBox(
              height: 10.h,
            ),
            InfoCard(
              imageIcon: Image.asset(
                'lib/assets/house.png',
                width: 24.w,
                height: 24.h,
              ),
              iconBackgroundColor: Colors.deepOrangeAccent.shade200,
              title: 'RENT/LOAN',
              percentage: '51%',
              money: '-\$1700',
            ),
            InfoCard(
              imageIcon: Image.asset('lib/assets/lightbulb.png',
                  width: 24.w, height: 24.h),
              iconBackgroundColor: Colors.blue[600]!,
              title: 'UTILITIES',
              percentage: '19%',
              money: '-\$500',
            ),
            InfoCard(
              imageIcon:
                  Image.asset('lib/assets/polo.png', width: 24.w, height: 24.h),
              iconBackgroundColor: Colors.tealAccent.shade700,
              title: 'CLOTHING',
              percentage: '16%',
              money: '-\$400',
            ),
            InfoCard(
              imageIcon: Image.asset('lib/assets/sedan.png',
                  width: 24.w, height: 24.h),
              iconBackgroundColor: Colors.yellow.shade700,
              title: 'CAR',
              percentage: '5%',
              money: '-\$160',
            ),
            InfoCard(
              imageIcon: Image.asset(
                'lib/assets/burger.png',
                width: 24.w,
                height: 24.h,
              ),
              iconBackgroundColor: Colors.deepPurple,
              title: 'EATING OUT',
              percentage: '4%',
              money: '-\$140',
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsScreen()),
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
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
