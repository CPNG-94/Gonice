import 'package:flutter/material.dart';
import 'package:gonice/page/latihan/screens/beginner_screen.dart';
import 'package:gonice/page/latihan/screens/expert_screen.dart';
import 'package:gonice/page/latihan/screens/list_screen.dart';

class LatihanList extends StatelessWidget {
  const LatihanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: InkWell(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                          'https://cdn.vectorstock.com/i/1000x1000/45/96/man-male-push-up-gym-workout-exercise-vector-8294596.webp',
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BeginnerScreen()),
                            );
                          },
                        ),
                        colorFilter: ColorFilter.mode(
                          const Color(0xFF00ADB5).withOpacity(1.0),
                          BlendMode.darken,
                        ),
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                      const Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: InkWell(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                          'https://thumbs.dreamstime.com/z/bearded-man-doing-lateral-raise-vector-drawing-bearded-man-doing-bent-over-row-vector-illustration-bearded-man-doing-workout-136115049.jpg',
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ExpertScreen()),
                            );
                          },
                        ),
                        colorFilter: ColorFilter.mode(
                          const Color(0xFF00ADB5).withOpacity(1.0),
                          BlendMode.darken,
                        ),
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                      const Text(
                        'Expert',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: InkWell(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                          'http://cdn.onlinewebfonts.com/svg/img_132306.png',
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListScreen()),
                            );
                          },
                        ),
                        colorFilter: ColorFilter.mode(
                          const Color(0xFF00ADB5).withOpacity(1.0),
                          BlendMode.darken,
                        ),
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      const Text(
                        'Custom',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
