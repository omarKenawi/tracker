import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/features/home/screens/details_screen.dart';
import '../widgets/info_card.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cardData = [
      {
        'Month': 'September',
        'amount': '-\$3500',
        'title': 'This month',
      },
      {
        'Month': 'October',
        'amount': '-\$2800',
        'title': 'Last month',
      },
      {
        'Month': 'November',
        'amount': '-\$3000',
        'title': 'Next month',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              color: Colors.white,
              child: Swiper(
                axisDirection: AxisDirection.right,
                layout: SwiperLayout.STACK,
                itemWidth: 350.w,
                itemHeight: 190.h,
                itemCount: cardData.length,
                scrollDirection: Axis.horizontal,
                containerHeight: 500.h,
                containerWidth: 500.w,
                fade: 10,
                index: 2,
                outer: false,
                scale: 10.1,
                allowImplicitScrolling: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: const LinearGradient(
                        colors: [Colors.blueAccent, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cardData[index]['title'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            cardData[index]['amount'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            cardData[index]['Month'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
            InfoCard(
              imageIcon: Image.asset('lib/assets/house.png',
                  width: 24.w, height: 24.h),
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
              imageIcon: Image.asset('lib/assets/burger.png',
                  width: 24.w, height: 24.h),
              iconBackgroundColor: Colors.deepPurple,
              title: 'EATING OUT',
              percentage: '4%',
              money: '-\$140',
            ),
            SizedBox(height: 20.h), // Add some spacing before the button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DetailsScreen()),
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
            SizedBox(height: 20.h), // Add some spacing after the button
          ],
        ),
      ),
    );
  }
}
