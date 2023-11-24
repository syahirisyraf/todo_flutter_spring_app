import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/pages/utils.dart';

class WelcomeSubTitle extends StatelessWidget {
  const WelcomeSubTitle({
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
      top: 630 * fem,
      child: Align(
        child: SizedBox(
          width: 275 * fem,
          height: 40 * fem,
          child: Text(
            'Also the leap into electronic type setting, remaning essentially unghanged.',
            style: safeGoogleFont(
              'Inter',
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.4285714286 * ffem / fem,
              color: const Color(0xb2030c1a),
            ),
          ),
        ),
      ),
    );
  }
}
