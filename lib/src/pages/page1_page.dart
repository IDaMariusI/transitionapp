import 'package:flutter/material.dart';

import 'package:transition_app/src/pages/pages.dart';

class Page1Page extends StatelessWidget {
  const Page1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: const Center(
        child: Text('Page1Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _createRoute());
        },
        child: const Icon(Icons.access_time),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          const Page2Page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        // return SlideTransition(
        //   position: Tween<Offset>(
        //     begin: const Offset(0.5, 1.0),
        //     end: Offset.zero,
        //   ).animate(curvedAnimation),
        //   child: child,
        // );

        // return ScaleTransition(
        //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
        //   child: child,
        // );

        return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
