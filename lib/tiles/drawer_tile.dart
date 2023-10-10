import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController _pageController;
  final int page;

  const DrawerTile(this.icon, this.text, this._pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop;
          _pageController.jumpToPage(page);
        },
        child: Container(
          color: _pageController.page!.round() == page ?
          const Color(0xfff5f5f5) : Colors.transparent,
          height: 60,
          child: Row(
            children: [
              Icon(icon, size: 30,
                color: _pageController.page!.round() == page ?
                    const Color(0xffff8000) : const Color(0xfff5f5f5)
              ),
              const SizedBox(width: 30),
              Text(text,
                  style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500,
                      color: _pageController.page!.round() == page ?
                      const Color(0xffff8000) : const Color(0xfff5f5f5)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
