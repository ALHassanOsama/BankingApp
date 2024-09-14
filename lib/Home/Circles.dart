// // import 'package:flutter/material.dart';

// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center( 

// //         child: Stack(
// //           children: [
// //             // Yellow circle
// //             Positioned(
// //               top: 100,
// //               left: 100,
// //               child: Container(
// //                 width: 150,
// //                 height: 150,
// //                 decoration: BoxDecoration(
// //                   color: Colors.yellow,
// //                   borderRadius: BorderRadius.circular(75), 

// //                 ),
// //               ),
// //             ),

// //             // Blue circle
// //             Positioned(
// //               top: 250,
// //               left: 250,
// //               child: Container(
// //                 width: 200,
// //                 height: 200,
// //                 decoration: BoxDecoration(
// //                   color: Colors.blue,
// //                   borderRadius: BorderRadius.circular(100),
// //                 ),
// //                  // Adjust opacity as needed
// //               ),
// //             ),

// //             // Your other content here
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//                    CircleAvatar(
//                     backgroundImage: NetworkImage
//                     ("https://avatars.githubusercontent.com/u/179759226?v=4"),
//                     radius: 22,
//                   ),
              
//              Spacer(),
//             SizedBox(width: 8), // Space between image and text
//             Text(
//               "Reports",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//              Spacer(),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 13, right: 15),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const ReportsItem(),
//                 const SizedBox(height: 20),
//                 Container(
//                   height: 420,
//                   padding: const EdgeInsets.all(1.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       // Add any shadow if needed
//                     ],
//                   ),
                  
//                 ),
//                 const SizedBox(height: 10),
//                 const ReportsItem2(),