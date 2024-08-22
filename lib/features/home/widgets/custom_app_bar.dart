import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const CustomAppBar({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      bottom: TabBar(
        controller: tabController,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.white,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        tabs: const [
          Tab(text: 'EXPENSES'),
          Tab(text: 'BALANCE'),
          Tab(text: 'SETTINGS'),
        ],
        labelStyle: TextStyle(
          fontSize: 18.sp, // Responsive font size
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp, // Responsive font size
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
    kToolbarHeight + kTextTabBarHeight,
  );
}
