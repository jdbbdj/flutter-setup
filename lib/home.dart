import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'blog.dart';
import 'main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      drawer: SafeArea(
          child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF6C63FF)),
              child: ListTile(
                  title: Text(
                "Flutter map",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Login();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_filled,
                  color: Color(0xFF6C63FF),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Color(0xFF6C63FF),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.document_scanner_outlined,
                color: Color(0xFF6C63FF),
              ),
              title: Text(
                "Blogs",
                style: TextStyle(
                    color: Color(0xFF6C63FF),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.map_rounded,
                color: Color(0xFF6C63FF),
              ),
              title: Text(
                "Maps",
                style: TextStyle(
                    color: Color(0xFF6C63FF),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Color(0xFF6C63FF),
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                    color: Color(0xFF6C63FF),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      )),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: const StadiumBorder()),
                      child: const Text("Money")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: const StadiumBorder()),
                      child: const Text("Bitcoin")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: const StadiumBorder()),
                      child: const Text("Stock Market")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: const StadiumBorder()),
                      child: const Text("House market")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Home();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6C63FF),
                          shape: const StadiumBorder()),
                      child: const Text("Diamond Hands")),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Blog();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                      )
                    ]),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'images/departing.svg',
                      width: 180,
                    ),
                    const ListTile(
                      title: Text("How to get started?"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Blog();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                      )
                    ]),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'images/boat.svg',
                      width: 180,
                    ),
                    const ListTile(
                      title: Text("What to do during trip?"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const Blog();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                      )
                    ]),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'images/on-the-spot.svg',
                      width: 180,
                    ),
                    const ListTile(
                      title: Text("How to start your iteninary?"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
