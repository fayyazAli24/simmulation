
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: AppBar(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            flexibleSpace: TabBar(
              physics: const BouncingScrollPhysics(),
              indicatorSize: TabBarIndicatorSize.label,
              // labelColor: AppColors.redAccent,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 0.5.h,
              tabs: const [
                Tab(
                  text: "Log In",
                ),
                Tab(
                  text: "Sign up",
                ),
              ],
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            // LoginView(),
            // SignUpView(),
            // Icon(Icons.directions_car, size: 350,color: Colors.black,),
          ],
        ),
      ),
    );
    ;
  }
}
