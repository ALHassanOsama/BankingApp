// userModel.dart
class UserModel {
  final String username;
  final double balance;

  UserModel({required this.username, required this.balance});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Convert balance to double, handling potential string inputs
    double parsedBalance;
    if (json['balance'] is String) {
      parsedBalance = double.tryParse(json['balance']) ?? 0.0; // Safely parse to double, fallback to 0.0
    } else {
      parsedBalance = json['balance'].toDouble();
    }

    return UserModel(
      username: json['username'] ?? 'User', // Handle null or missing username
      balance: parsedBalance,
    );
  }
}
