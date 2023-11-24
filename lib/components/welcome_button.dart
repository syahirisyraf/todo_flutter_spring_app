import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/pages/home_page.dart';
import 'package:todo_flutter_spring_app/pages/utils.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.fem,
    required this.ffem,
  });

  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // rectangle3TZb (3:12)
      left: 48 * fem,
      top: 702 * fem,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
        child: Align(
          child: SizedBox(
            width: 279 * fem,
            height: 48 * fem,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12 * fem),
                color: const Color(0xff030c1a),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x33000000),
                    offset: Offset(8 * fem, 8 * fem),
                    blurRadius: 12 * fem,
                  ),
                ],
              ),
              child: Text(
                'Get Started',
                textAlign: TextAlign.center,
                style: safeGoogleFont(
                  'Inter',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 2.5 * ffem / fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
