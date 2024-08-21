import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.h), // Use ScreenUtil for responsive height
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  title: Text(
                    'Expenses',
                    style: TextStyle(
                      fontSize: 18.sp, // Responsive font size
                      color: Colors.black,
                      fontWeight: selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    onItemSelected(0);
                    Navigator.of(context).pop(); // Close the drawer after selection
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  title: Text(
                    'Balance',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    onItemSelected(1);
                    Navigator.of(context).pop(); // Close the drawer after selection
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    onItemSelected(2);
                    Navigator.of(context).pop(); // Close the drawer after selection
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}