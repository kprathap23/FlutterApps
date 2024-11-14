import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.1),
                spreadRadius: -4,
                blurRadius: 16,
                offset: Offset(-8, 0), // Left shadow
              ),
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.1),
                spreadRadius: -4,
                blurRadius: 16,
                offset: Offset(8, 0), // Right shadow
              ),
            ],
            gradient: RadialGradient(
              colors: [
                Colors.deepPurple[400]!,
                Colors.deepPurple[300]!,
              ],
              center: Alignment(-0.8, -0.8),
              radius: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Current Balance',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$143,421.20',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '3.6% from last month',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 180,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 180,
              width: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     print('Button pressed!');
        //   },
        //   child: Container(
        //     width: 50.0,
        //     height: 50.0,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       color: Colors.blue,
        //     ),
        //     child: Icon(Icons.add),
        //   ),
        // ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 180,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OverlappingCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set width for the container
      height: 200, // Set height for the container
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the container circular
        color: Colors.transparent, // Transparent background
      ),
      child: Stack(
        alignment: Alignment.center, // Align the circles to the center
        children: [
          // First circle
          Positioned(
            left: 0,
            top: 0,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue.withOpacity(0.5),
            ),
          ),
          // Second circle
          Positioned(
            left: 30,
            top: 30,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red.withOpacity(0.5),
            ),
          ),
          // Third circle
          Positioned(
            left: 60,
            top: 60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.green.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
