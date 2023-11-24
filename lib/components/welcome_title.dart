import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/pages/utils.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 41 * fem,
      top: 495 * fem,
      child: Align(
        child: SizedBox(
          width: 262 * fem,
          height: 120 * fem,
          child: Text(
            'Discover best places anywhere in the world',
            style: safeGoogleFont(
              'Inter',
              fontSize: 32 * ffem,
              fontWeight: FontWeight.w600,
              height: 1.25 * ffem / fem,
              color: const Color(0xff030c1a),
            ),
          ),
        ),
      ),
    );
  }
}
