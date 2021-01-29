import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: const ValueKey<bool>(true),
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.share_outlined,
                  color: Colors.transparent,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.palette,
                  color: Colors.transparent,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmarks_outlined,
                  color: Colors.transparent,
                ),
                label: ''),
          ],
        ),
      );
}
