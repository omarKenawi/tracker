import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(height: 50.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 24.w,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Implement your logout logic here
                    print('Logout clicked');
                    // For example, you might navigate to a login screen or show a confirmation dialog
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
