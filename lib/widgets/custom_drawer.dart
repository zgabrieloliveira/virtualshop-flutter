import 'package:flutter/material.dart';
import 'package:virtual_shop/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageController;

  const CustomDrawer(this._pageController);

  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.deepOrange, Colors.orangeAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
      children: [
        _buildDrawerBack(),
        ListView(
          padding: const EdgeInsets.only(top: 16, left: 32),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                    top: 0, right: 0,
                    child: Image.asset("assets/images/nikeswoosh.png",
                        color: const Color(0xfff5f5f5)),
                  ),
                  const Positioned(
                      top: 8,
                      left: 0,
                      child: Text("Nike Shop",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NikeFont',
                              color: Color(0xfff5f5f5),
                              letterSpacing: 0.1))),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Olá,",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("Entre ou Cadastra-se >",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold)),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            const Divider(color: Color(0xfff5f5f5)),
            DrawerTile(Icons.home, "Início", _pageController, 0),
            DrawerTile(Icons.list, "Produtos", _pageController, 1),
            DrawerTile(Icons.location_on, "Lojas Nike", _pageController, 2),
            DrawerTile(
                Icons.playlist_add_check, "Meus Pedidos", _pageController, 3),
          ],
        )
      ],
    ));
  }
}
