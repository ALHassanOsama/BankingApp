import 'package:flutter/material.dart';
import 'package:flutter_course1/Home/transaction_card.dart';
class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body:
       const Center(
        child: Padding(
        padding: EdgeInsets.only(right: 10, left: 17),
        child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              
              children: [
                Expanded(child: Text('Jan')),
                Expanded(child: Text('Feb')),
                Expanded(child: Text('Mar')),
                Expanded(child: Text('Apr')),
                Expanded(child: Text('Aug')),
                Expanded(child: Text('Oct')),
              ],
            ),
            SizedBox(height: 30),
            TransactionCard(
              label: ' Shopping',
              date: ' Tue 15.06.2021',
              amount: '\$29.90 ', title: '',
            ),
            TransactionCard(
              label: ' Movie Ticket',
              date: ' Wed 16.06.2021',
              amount: '\$9.50 ', title: '',
            ),
            TransactionCard(
              label: ' Amazon',
              date: ' Thu 17.06.2021',
              amount: '\$19.30 ', title: '',
            ),
            TransactionCard(
              label: ' Udemy',
              date: ' Fri 18.06.2021',
              amount: '\$14.99 ', title: '',
            ),
            SizedBox(height: 10),
            TransactionCard(
              label: ' Books',
              date: ' Fri 08.05.2021',
              amount: '\$14.00 ', title: '',
            ),
            SizedBox(height: 10),
            TransactionCard(
              label: ' Spotify',
              date: ' Mon 11.03.2021',
              amount: '\$8.99 ', title: '',
            ),
             SizedBox(height: 10),
            TransactionCard(
              label: ' Coursera',
              date: 'Fri 5.11.2021',
              amount: '\$108.99 ', title: '',
            ),
             SizedBox(height: 10),
            TransactionCard(
              label: ' Discord',
              date: 'Sun 5.12.2023',
              amount: '\$99.50 ', title: '',
            ),
            SizedBox(height: 10),
            TransactionCard(
              label: 'Chat-Gpt',
              date: 'Wed 15.12.2023',
              amount: '\$240 ', title: '',
              
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}