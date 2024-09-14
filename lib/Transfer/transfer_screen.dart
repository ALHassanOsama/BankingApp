import 'package:flutter/material.dart';
import "package:flutter_course1/Transfer/transferBuildIcons.dart";
import "package:flutter_course1/Transfer/transferContactBuilder.dart";

import "TransferDetailPage.dart";


class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
              children: [
               
                  
                   CircleAvatar(
                    backgroundImage: NetworkImage
                    ("https://avatars.githubusercontent.com/u/179759226?v=4"),
                    radius: 22,
                  ),
              
             Spacer(),
            SizedBox(width: 8), // Space between image and text
            Text(
              "Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
             Spacer(),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add), // The "+" sign
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransferDetailsPage()),
                );
              // Define the action when the "+" button is pressed
            },
          ),
        ],
      ),
      body: const Center(
       child: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
             TransfeBulidicon1(imageUrl: "https://s3-alpha-sig.figma.com/img/eb56/6bda/6746485c2a77a47019b2cba6815beed0?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Q~Vg4-lp0Ad~fg6VmekaRhLesHRPoxy3~XfvJ-GgZARvefWsIP6Dv2Dq8injuN0HnbdUVLxemf5YZ5Vwld-nkNdG8C4J~oEmEERM9gmNql2zdk4qcYeV-BScG441a55kaEblR3v--jb1igoi~TZFxNddMxd9-UAruGMgfG3a3w~ETYdAfz3sqGxdxZBnqSqfD3hemIvWZq8YmC7DgM0eVXTb-BhH2VP0zE7w2ZHV5oYf8kzUjOqHeomYZcfNeJBfUdCgMQRJ-k8wn~BB5DG4jKgiqMoMr34734AJlxnQmHQ5VHzMEr0T8QBszsxl9sJ7HWyS6SibniMPXY8eSxj3Vw__"),
             TransfeBulidicon1(imageUrl: "https://s3-alpha-sig.figma.com/img/0c5a/8e46/bf1dde2fa4e0cea13bf3b58d734b3851?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=huuB3hT9IGLLIrrm7ch2QJ7mKeXDqENkSjmyg4AO8LA-kEcMPO4C05~nRWOGqluMuQl04xls6ZkTDyUcZxHrSnc-EzbKgL6HUuiWpfJB9VbEX9OGHBOB5btZS-4CD2-b18li0hGvMlKqSjz5yqvRHTJRTjaho2MI7-KvvK87lLrHYVwatW~RN32Zr6Oin6LGhFgY9T1ied4~wg3-e8dbG49eWi-WuK3D6OWY0EGA~k1~DI7YcvXOw5kqxtWx9k7hJMzX8zdLsDRspBmK~HK4H7gLZE4pkiUjJftE9hUt3cPRhzeEi2ULNhRoeVh-rrZneVCDpj3j4yJ0WlnXkshZBg__"),
             TransfeBulidicon1(imageUrl: "https://s3-alpha-sig.figma.com/img/8fda/be70/f6b94a8cbeed2df5f6ecc47eb2c841a0?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PGDXvmEfeMCAKPqtrbGdm0fP15TZExNa~5QtuvhPJWVXC8AvwE8gruak9DF7vKoCu9~gYj5hFsIo3UWmY1lLgmhtl97nQtGkMMMpmTxBDYCuXnWnjufj5XVa3vOTDO~zaRBZ5fMq5s1LsxK5RLleiyOOFwCm6bX1~Hex6G0keq3AIq~eYkMTAcA7jai5iGAu49qstqQCsh2n4Z0fW0iXlyF~5P0CFv9EKJ7P49m7YxE96KEe6tEwXexIK4WdG8bIxMDSHXty8M7DwH5twM7cR-YGXId87Roqb3rxFP1miK2kHjr4uHIAhvh42IMjlId~zGTnuaaHmvqmQ~eVHXrALA__"),
             TransfeBulidicon1(imageUrl: "https://s3-alpha-sig.figma.com/img/537e/072e/35bac0a6469ba43605bfab15dd21146d?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=UXhHy02n~ec3yP-8mElUulKscQdrBf7uuMunAtjahUC3iimbv-14LgMePVuhszx4w4ANWZIZQdZnsmnuAmfL4q1rIUfbVG1bX73spaBdAIBdxbM2nqOPZaUPnb9X~a893G3xwJTxIey3t5zZCsKiaW8qCY0VVefYMOFyoN~I-KGCYqbvEsJMmajhixMQhjMGMUTKpYj1E~N5ry7tsYBu0D78sTSImnTYis0C8ARGa-l2fM4odzqtbKCY6RtF-KbD8GHjZ3mclg0M8Pbfqrxy0u5hZNE5i5-Vikwey6yWl9wk0jta0zi5uP0lC2y6SP4dTWlpeqZGBaG5hS4qAGGvBg__"),
              ]
            ),
            SizedBox(height: 20,),
            TransferContacttile(name: "AL-Hassan Osama", account: "AW BANK UNI 234-46589-000", imageUrl:"https://media.licdn.com/dms/image/v2/D4D03AQEDgssSEgTrJw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1718220139301?e=1730937600&v=beta&t=8pF5jR_4JtIJKQYwIVZ6AezuB67xAqJS0JQNWSTzOh0") ,
            TransferContacttile(name: "Abdo Farid", account: "AW BANK UNI 234-46589-000", imageUrl:"https://avatars.githubusercontent.com/u/179433508?v=4") ,
            TransferContacttile(name: "Mazen Ahmed", account: "AW BANK UNI 234-46589-000", imageUrl:"") ,
            TransferContacttile(name: "Omar Rajab", account: "AW BANK UNI 234-46589-000", imageUrl:"") ,
            TransferContacttile(name: "Youssef Ahmed", account: "AW BANK UNI 234-46589-000", imageUrl:"") ,
            TransferContacttile(name: "Ali Ahmed", account: "AW BANK UNI 234-46589-000", imageUrl:"") ,
          ]
        )
        
        )
       )
       )

          // Placeholder content
     
    ); 
  }
}