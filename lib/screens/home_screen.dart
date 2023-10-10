import 'package:flutter/material.dart';
import '../tabs/home_tab.dart';
import '../tabs/products_tab.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(body: HomeTab(), drawer: CustomDrawer(_pageController)),
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Produtos",
                style: TextStyle(
                    fontFamily: 'NikeFont',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xfff5f5f5))),
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        )
      ],
    );
  }
}
