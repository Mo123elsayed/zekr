import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 25.0, right: 26.0),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: 40,
              child: Image.asset(
                'assets/imgs/pngs/mosque_skyline.png',
                width: 200,
                height: 120,
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Assalamu Alaykum',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 8, 68, 50),
                      fontFamily: "Pliant",
                    ),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Text(
                    'Welcome to Zekr App',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontFamily: "Pliant",
                    ),
                  ),
                ),
                SizedBox(height: 90),
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0A5A42), Color(0xFF084432)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Dhikr of the Day',
                            style: TextStyle(
                              color: Colors.yellow[200],
                              fontSize: 15,
                              fontFamily: "Cairo",
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'سبحان الله',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 14, fontFamily: "Pliant"),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: GridView.count(
                    mainAxisSpacing: 10.w,
                    mainAxisExtent: 90.h,
                    crossAxisSpacing: 10.w,
                    childAspectRatio: 7 / 8,
                    crossAxisCount: 2,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.book, color: Colors.green[700]),
                          ),
                          SizedBox(width: 10),
                          Text('Quran'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.book, color: Colors.green[700]),
                          ),
                          SizedBox(width: 10),
                          Text('Quran'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
