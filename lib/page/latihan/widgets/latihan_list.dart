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
                          'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
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
              splashColor: const Color(0xFF00ADB5),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Ink.image(
                        image: const NetworkImage(
                          'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
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
                          'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80',
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
                        fit: BoxFit.fitWidth,
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
