import 'package:flutter/material.dart';
import 'package:tracker/features/home/screens/settings_screen.dart';
import 'package:tracker/features/home/screens/balance_screen.dart';
import 'package:tracker/features/home/screens/expenses_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  void _onDrawerItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    title: Text(
                      'Expenses',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () => _onDrawerItemSelected(0),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    title: Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () => _onDrawerItemSelected(1),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onTap: () => _onDrawerItemSelected(2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/images/drawer_icon.png', // Your custom drawer icon
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
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'EXPENSES'),
            Tab(text: 'BALANCE'),
            Tab(text: 'SETTINGS'),
          ],
          labelStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ExpensesScreen(),
          BalanceScreen(),
          SettingsScreen(),
        ],
      ),
    );
  }
}
