import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_rating/flutter_rating.dart";
import "package:learning_flutter/widgets/content_column.dart";
import "package:learning_flutter/widgets/modules/restaurants/entities/restaurant.dart";
import "package:learning_flutter/widgets/modules/restaurants/widgets/custom_restaurant_item.dart";
class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool _isLoading = true;
  List<Restaurant> restaurants = [];
  @override
  void initState() {
    super.initState();
      db.collection("restaurants").snapshots().listen((event) {
        restaurants.clear();
        for(var document in event.docs) {
            Restaurant restaurant = Restaurant(
            document.id,
            document.data()['name'],
            document.data()['description'],
            List<String>.from(document.data()['images']),
            document.data()['rating'].toDouble(),
            document.data()['count']
          );
          restaurants.add(restaurant);
        }
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: ListView.separated(
        itemCount: restaurants.length,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return CustomRestaurantItem(restaurant: restaurants[index],);
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.grey[850],
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

