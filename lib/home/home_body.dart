
import 'package:flutter/material.dart';
import 'package:m_boote/second_page/second_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity! < 0) {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 6),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SecondScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        }
      },
      child: Center(
        child: Image.asset(
          'assets/logo-transparent-png.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
