import 'package:flutter/material.dart';
import 'package:flutter_course1/login&signin/loginPage.dart';
import 'package:flutter_course1/Controllers/deleteUserController.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});

  // Instance of ApiService
  final ApiService _apiService = ApiService();

  // Function to handle user deletion
  Future<void> _handleDeleteUser(BuildContext context) async {
    try {
      bool success = await _apiService.deleteCurrentUser();

      if (success) {
        // Show success message and navigate to login page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User deleted successfully')),
        );

        await Future.delayed(Duration(seconds: 1));

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      } else {
        // Handle deletion failure
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete user')),
        );

        // Log or print the error for debugging
      }
    } catch (e) {
      // Handle unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An unexpected error occurred')),
      );

      // Log or print the error for debugging
      print('Unexpected error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More options'),
      ),
       body: Center(
         child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => _handleDeleteUser(context),
                child: const Text('Delete User'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 70.0),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ],
            ),
          ),
       ),
      );
  }
}