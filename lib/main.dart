import 'package:flutter/material.dart';
import 'package:flutter_course1/intro/onBoardingScreen.dart';
import 'Controllers/transferController.dart';
import 'Home/home_screen.dart';
import 'More/morePage.dart';
import 'Reports/reports_screen.dart';
import 'Transfer/transfer_screen.dart';
import 'bottomNavBar/bottomNavBar.dart';
import 'login&signin/loginPage.dart';
import 'login&signin/sign_up_page.dart';
void main() {
  runApp(const App());
}
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
      initialRoute: '/',
       routes: {
        '/': (context) => const OnBoardingScreen(),
        '/home': (context) => const MyApp(),
        '/signUp': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 int _selectedIndex = 0;
   final TransferService transferService = TransferService(); // Create an instance of TransferService


  final List<Widget> _pages = [
    const HomePage(),
    const TransferPage(),
    const ReportsPage(),
      MorePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
} 








// import 'package:flutter/material.dart';
// import 'package:flutter_course1/login&signin/loginPage.dart';
// import 'package:flutter_course1/login&signin/sign_up_page.dart';
// import 'bottomNavBar/bottomNavBar.dart';
// import 'Home/home_screen.dart';
// import 'More/morePage.dart';
// import 'Reports/reports_screen.dart';
// // import 'transactions_screen.dart';
// import 'Transfer/transfer_screen.dart';
// import 'intro/onBoardingScreen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const TransferPage(),
//     const ReportsPage(),
//     const MorePage(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//         ),
//       ),
//       initialRoute: "onBoardingScreen",
//       routes: {
//         'onBoardingScreen': (context) => const OnBoardingScreen(),
//         '/home': (context) => const MyApp(),
//         '/signUp': (context) => const SignUpPage(),
//         '/login': (context) => const LoginPage(),
//       },
//       home: Scaffold(
//         body: _pages[_selectedIndex],
//         bottomNavigationBar: const BottomNavBar(),
//       ),
//     );
//   }
// }


