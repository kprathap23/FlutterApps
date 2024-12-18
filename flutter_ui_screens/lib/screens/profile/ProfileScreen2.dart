// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'TCustomCurvedEdges.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key});

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          ClipPath(
            clipper: TCustomCurvedEdges(),
            child: Container(
              // color: const Color.fromARGB(255, 75, 104, 255),
              color: Colors.red[300],
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      // 3 LEFT side curves

                      Positioned(
                        top: 0,
                        left: -210,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(0.1))),
                      ),

                      Positioned(
                        top: 0,
                        left: -240,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(.1))),
                      ),

                      Positioned(
                        top: 0,
                        left: -270,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(.1))),
                      ),

                      // 3 RIGHT side curves
                      Positioned(
                        top: 0,
                        right: -210,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(0.1))),
                      ),

                      Positioned(
                        top: 0,
                        right: -240,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(.1))),
                      ),

                      Positioned(
                        top: 0,
                        right: -270,
                        child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(300),
                                color: Colors.white.withOpacity(.1))),
                      ),

                      // Bottom Curve - try with -10, -150
                      // Positioned(
                      //   bottom: -150,
                      //   child: Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       height: 300,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(300),
                      //           color: Colors.white.withOpacity(.2))),
                      // ),

                      // Circle Avatar
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    "https://randomuser.me/api/portraits/men/46.jpg")),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pratap Kumar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.person_4),
                title: Text("Profile"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Profile");
                },
              ),
              ListTile(
                leading: Icon(Icons.security),
                title: Text("Change Password"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Change Password");
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Privacy Policy"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Privacy ");
                },
              ),
              ListTile(
                leading: Icon(Icons.help_center),
                title: Text("Help Center"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Help Center ");
                },
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Rate Us"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Help Center ");
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Settings ");
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
                onTap: () {
                  print("Logout ");
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
