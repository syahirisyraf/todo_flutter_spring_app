import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  const BoxContainer({
    super.key,
    required this.fem,
  });

  final double fem;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 17 * fem,
      top: 451 * fem,
      child: SizedBox(
        width: 343 * fem,
        height: 343 * fem,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32 * fem),
            color: const Color(0xfffff6f6),
          ),
        ),
      ),
    );
  }
}
