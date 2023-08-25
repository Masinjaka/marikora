import 'package:flutter/material.dart';

import 'dashboard.dart';

class MOCenterPageView extends StatelessWidget {
  const MOCenterPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: pageController,
        children: [
          const DashboardPage(),
          Container(
              color:Colors.white,
              child: const Center(child: Text("Pointage"),)),
          Container(
              color:Colors.white,
              child: const Center(child: Text("Personnels"),)),
          Container(
              color:Colors.white,
              child: const Center(child:Text("Paramètre"),)),
          Container(
              color:Colors.white,
              child: const Center(child: Text("Support"),)),
        ],
      ),
    );
  }
}