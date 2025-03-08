import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  const Scroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recommended Foods",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Horizontal Scrollable Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  FoodCard(
                    title: "Fruit Salad",
                    rating: "4.8",
                    description: "A fresh mix of seasonal fruits.",
                    imagePath: "assets/fruit_salad.png",
                  ),
                  SizedBox(width: 10),
                  FoodCard(
                    title: "Berry Delight",
                    rating: "4.7",
                    description: "A mix of strawberries, blueberries & more!",
                    imagePath: "assets/fruit_salad.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FoodCard Widget with Gradient Background
class FoodCard extends StatelessWidget {
  final String title;
  final String rating;
  final String description;
  final String imagePath;

  const FoodCard({
    super.key,
    required this.title,
    required this.rating,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orangeAccent, Colors.greenAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Text Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "Rating ⭐ $rating",
                style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
            ],
          ),

          // Positioned Image
          Positioned(
            right: -10,
            top: -10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath, height: 80, width: 80, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
