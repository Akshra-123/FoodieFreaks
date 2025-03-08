import 'package:flutter/material.dart';
import 'package:new_flutter/Scrol.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Searchbar(),
  ));
}

class Searchbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
     body: Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Search Bar
      Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search..",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      SizedBox(height: 5),

      // FIX: Prevent infinite size error
      Expanded(
        child: Scroll(), // Wrap Scroll() with Expanded
      ),
    ],
  ),
),

    );
  }
}


class FoodCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const FoodCard({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 5),
                Text(description, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

// List Item Widget for Searched Items
class SearchedItem extends StatelessWidget {
  final String title;
  final String calories;
  final String imagePath;

  const SearchedItem({
    required this.title,
    required this.calories,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, width: 40, height: 40),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Calories: $calories"),
      trailing: Icon(Icons.keyboard_arrow_down),
    );
  }
}
