import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: const ValueKey<bool>(true),
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: const NavigationBar(
          backgroundColor: Colors.grey,
          labelBehavior: NavigationBarDestinationLabelBehavior.alwaysHide,
          destinations: [
            NavigationBarDestination(icon: Icon(Icons.share_outlined, color: Colors.transparent), label: ''),
            NavigationBarDestination(icon: Icon(Icons.palette_outlined), label: ''),
            NavigationBarDestination(icon: Icon(Icons.bookmarks_outlined, color: Colors.transparent), label: ''),
          ],
        ),
      );
}
