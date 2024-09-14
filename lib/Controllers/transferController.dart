import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TransferService {
  // Base URL for the API
  final String baseUrl = 'https://ptechapp-5ab6d15ba23c.herokuapp.com';

  // Function to handle the transfer
  Future<String> transferMoney(String amount, String receiverId) async {
    // Define the API URL for transfer
    final String url = '$baseUrl/payments/transfer';

    // Retrieve the sender's account number from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? senderAccountNumber = prefs.getString('userAccountID');

    // Check if the senderAccountNumber is available
    if (senderAccountNumber == null) {
      return 'Error: Sender account not found. Please log in again.';
    }

    // Prepare the request body
    final Map<String, dynamic> requestBody = {
      "receiverAccountNumber": receiverId,         // Receiver's account number entered by the user
      "senderAccountNumber": senderAccountNumber, // Use the sender's account number from SharedPreferences
      "paymentDate": DateTime.now().toIso8601String(),
      "paymentAmount": int.parse(amount),          // Amount to be transferred
      "paymentType": "test"                        // Payment type (adjust as needed)
    };

    try {
      // Make the HTTP POST request
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      // Check the response status
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 'Transfer successful';
      } else {
        return 'Transfer failed: ${response.body}';
      }
    } catch (e) {
      // Handle errors
      return 'Error occurred: $e';
    }
  }
}
