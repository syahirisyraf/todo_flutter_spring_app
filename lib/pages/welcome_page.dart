import 'package:flutter/material.dart';
import 'package:todo_flutter_spring_app/components/box_container.dart';
import 'package:todo_flutter_spring_app/components/welcome_button.dart';
import 'package:todo_flutter_spring_app/components/welcome_subtitle.dart';
import 'package:todo_flutter_spring_app/components/welcome_title.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 812 * fem,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(32 * fem),
          gradient: const LinearGradient(
            begin: Alignment(0, 1),
            end: Alignment(0, -1),
            colors: <Color>[Color(0xff030c1a), Color(0x00030c1a)],
            stops: <double>[0, 1],
          ),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/images/welcom-page-bg.png')),
        ),
        child: Stack(
          children: [
            // Box Container
            BoxContainer(fem: fem),

            // Title 1
            WelcomeTitle(fem: fem, ffem: ffem),

            // Title 2
            WelcomeSubTitle(fem: fem, ffem: ffem),

            // Welcome Button
            WelcomeButton(fem: fem, ffem: ffem),
          ],
        ),
      ),
    );
  }
}
