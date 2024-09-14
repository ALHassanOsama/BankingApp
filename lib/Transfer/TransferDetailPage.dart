// lib/transferDetailPage.dart

import 'package:flutter/material.dart';

import '../Controllers/transferController.dart';  // Adjust the import according to your folder structure

class TransferDetailsPage extends StatelessWidget {
  TransferDetailsPage({super.key});

  final TextEditingController amountController = TextEditingController();
  final TextEditingController receiverIdController = TextEditingController();
  final TransferService transferService = TransferService();  // Instance of TransferService

  // Function to handle the button press and perform the transfer
  Future<void> _handleTransfer(BuildContext context) async {
    // Get input values
    final String amount = amountController.text;
    final String receiverId = receiverIdController.text;

    // Ensure fields are not empty
    if (amount.isEmpty || receiverId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    // Call the transfer function from the service
    final String result = await transferService.transferMoney(amount, receiverId);

    // Show feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input for amount
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            // Input for receiver's user ID
            TextFormField(
              controller: receiverIdController,
              decoration: const InputDecoration(
                labelText: 'Receiver User ID',
              ),
            ),
            const SizedBox(height: 20),
            // Transfer button
            ElevatedButton(
              onPressed: () => _handleTransfer(context),
              child: const Center(child: Text('Transfer')),
            ),
          ],
        ),
      ),
    );
  }
}
