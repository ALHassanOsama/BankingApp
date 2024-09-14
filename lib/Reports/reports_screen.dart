
import 'package:flutter/material.dart';
import 'chartsBuilder.dart';
import 'reports1.dart';
import 'reports2.dart';


class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                            padding: const EdgeInsets.all(2), // Space between avatar and border
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              
                            ),
                          child: Container(
                            padding: const EdgeInsets.all(2), // Space between avatar and border
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 238, 238, 239),
                                  Color.fromARGB(255, 251, 251, 251)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                  child: const CircleAvatar(
                    backgroundImage:NetworkImage("https://avatars.githubusercontent.com/u/179759226?v=4"),
                    radius: 20,
                  ),
                ),
                ),
                
              ],
            ),
            const Spacer(),
            // Space between image and text
            const Text(
              "Reports",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const SizedBox(width: 39),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.5, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ReportsItem(),
                const SizedBox(height: 20),
                Container(
                  height: 420,
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      // Add any shadow if needed
                    ],
                  ),
                  child: const MonthlySpendingChart(),
                ),
                const SizedBox(height: 10),
                const ReportsItem2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}