import "package:flutter/material.dart";
import "package:flutter_course1/Home/TransactionsPage.dart";
import "package:flutter_course1/Models/userModel.dart";
import "../Controllers/homePageController.dart";
// import "../Models/signupModel.dart";
import "transaction_card.dart";


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String? username;
  double? balance;
  final UserController _controller = UserController();
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  Future<void> _loadUserData() async {
    String? userAccountID = await _controller.getUserAccountId();
    if (userAccountID != null) {
      try {
        UserModel? user = await _controller.fetchUserData(userAccountID);
        if (user != null) {
          setState(() {
            username = user.username;
            balance = user.balance;
          });
        } else {
          // Show error if no user is found
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not found')),
          );
        }
      } catch (e) {
        // Handle error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load user data: $e')),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // 1/4 Circle at the top right
          Positioned(
            top: -74,
            left: 251,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(248, 244, 212, 154),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                ),
              ),
            ),
          ),
          // Half Circle at the middle left
          Positioned(
            top: 246,
            left: -72,
            child: Container(
              width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Color.fromARGB(250, 152, 207, 244),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Stack(
                        children: [
                          
                          Container(
                            padding: const EdgeInsets.all(4),
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
                              backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/179759226?v=4"), 
                         radius: 30,
                            ),
                          ),
                          
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good morning',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            username ?? 'User', // Fallback to 'User' if username is null
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20, width: 50),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.15,
                        
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 11),
                            const Text(
                              " Current Balance",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              balance != null ? ' \$${balance!.toStringAsFixed(2)}' : '\$0.00',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 1),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.25,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 98, 47, 238),
                              Color.fromARGB(255, 238, 156, 241)
                            ],
                            begin: Alignment.topLeft, end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              ' 3452 1235 7894 1678',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              ' 4/25/2025',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LAST TRANSACTIONS',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the TransactionsPage when 'More' is tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransactionsPage(),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text(
                              'More >',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
         const SizedBox(height: 10),
                   const TransactionCard(
                     label: "Shopping",
                     date: "Tue 12.05.2021",
                     amount: "\$29.90", title: '',
                   ),
                   const TransactionCard(
                     label: "Movie Ticket",
                     date: "Mon 11.05.2021",
                     amount: "\$9.50", title: '',
                   ),
                   const TransactionCard(
                     label: "Amazon",
                     date: "Mon 11.05.2021",
                     amount: "\$19.30", title: '',
                   ),
                   // Add your new TransactionCard widgets here
                   const TransactionCard(
                     label: "Coffee Shop",
                     date: "Fri 31.08.2024",
                     amount: "\$4.20", title: '',
                   ),
                   const TransactionCard(
                     label: "Restaurant",
                     date: "Fri 31.08.2024",
                     amount: "\$25.00", title: '',
                   ),
            
          ],
        ),
      ),
      
    )]
    )
    );
  }
}






// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: const Color(0xFFF5F5F5),
//       body: 
//             SafeArea( 
              
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   const SizedBox(height: 80),
//                   const CircleAvatar (
//                     backgroundImage: NetworkImage(
//                         "https://avatars.githubusercontent.com/u/179759226?v=4"), 
//                     radius: 30,
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Good morning",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const Text(
//                         "AL-Hassan Osama",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
            
//             const SizedBox(height: 5),
//             Expanded(
//               child: Center(
//                 child: Container(
//                   width: 300,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: const Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // First section for the current balance
//                       const Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Current Balance",
//                               style: TextStyle(
//                                 color: Color.fromRGBO(51, 51, 51, 1),
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               "\$12567.89",
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Second section with the gradient and card details
//                       Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(16),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.vertical(
//                             bottom: Radius.circular(16),
//                           ),
//                           gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                             colors: [
//                               Color(0xFF4961DC), // Blue color
//                               Color(0xFFDB7FB3), // Pink-Purple color
//                             ],
//                           ),
//                         ),
//                         child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "3452 1235 7894 1678",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8  ),
//                             Text(
//                               "05/2025",
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 15),
//                   Row(
                    
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(left: 20.0),
//                         child: const Text(
                          
//                           'LAST TRANSACTIONS',
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
                      
//                       GestureDetector(
//                         onTap: () {
//                           // Navigate to the TransactionsPage when 'More' is tapped
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const TransactionsPage(),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 20.0),
//                           child: const Row(
//                             children: [
//                               Text(
//                                 'View More >',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.blue,
//                                   fontWeight: FontWeight.bold,
                                  
//                                 ),
//                               ),
//                                // The arrow icon
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//              const SizedBox(height: 16),
//             Expanded(
//               child: ListView(
//                 children: const [
//                   TransactionCard(
//                     label: "Shopping",
//                     date: "Tue 12.05.2021",
//                     amount: "\$29.90", title: '',
//                   ),
//                   TransactionCard(
//                     label: "Movie Ticket",
//                     date: "Mon 11.05.2021",
//                     amount: "\$9.50", title: '',
//                   ),
//                   TransactionCard(
//                     label: "Amazon",
//                     date: "Mon 11.05.2021",
//                     amount: "\$19.30", title: '',
//                   ),
//                   // Add your new TransactionCard widgets here
//                   TransactionCard(
//                     label: "Coffee Shop",
//                     date: "Fri 31.08.2024",
//                     amount: "\$4.20", title: '',
//                   ),
//                   TransactionCard(
//                     label: "Restaurant",
//                     date: "Fri 31.08.2024",
//                     amount: "\$25.00", title: '',
//                   ),
//                   // Add more TransactionCard widgets as needed
//                 ],
//               ),
//             ),
            
//           ],
//         ),
//       ),
      
//     );
//   }
// }