import 'package:flutter/material.dart';


class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for the image at the top
              Container(
                height: 200,
                child:Image.network("https://s3.us-west-2.amazonaws.com/www.bookingninjas.com/img/vacation_rental5.png"),  // Replace with your asset image
              ),
              const SizedBox(height: 24),

              // Title text
              const Text(
                'Free Transactions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Subtitle text
              Text(
                'Provides the quality of the financial system with free money transactions without any fees.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}