// lib/api_service.dart

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com';

  // Method to delete the current logged-in user
  Future<bool> deleteCurrentUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? userId = prefs.getString('userAccountID');

      if (userId == null) {
        print('Error: User ID not found in SharedPreferences.');
        return false;
      }

      final String url = '$baseUrl/user/$userId';

      // Send DELETE request
      final response = await http.delete(Uri.parse(url), headers: {
        'Content-Type': 'application/json', // Include content type header
        // Include other headers like authorization if required
      });

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      // Check if the deletion was successful
      if (response.statusCode == 500 || response.statusCode == 204) {
        // Optionally clear the saved user ID after deletion
        await prefs.remove('userAccountID');
        return true;
      } else {
        print('Failed to delete user: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred while deleting user: $e');
      return false;
    }
  }
}
