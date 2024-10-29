import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import "package:learning_flutter/widgets/modules/restaurants/entities/restaurant.dart";

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;
  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  bool _isLoading = true;
  String title = 'Detalles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            .doc(widget.restaurant.id)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (!snapshot.hasData ||
              snapshot.data == null ||
              !snapshot.data!.exists) {
            return const Text("No se encontró eñ restaurante");
          }
          Restaurant restaurantSnapshot = Restaurant(
              widget.restaurant.id,
              snapshot.data!.get('name'),
              snapshot.data!.get('description'),
              List<String>.from(snapshot.data!.get('images')),
              snapshot.data!.get('rating'),
              snapshot.data!.get('count'));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  aspectRatio: 16 / 9,
                ),
                items: restaurantSnapshot.images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(i));
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          restaurantSnapshot.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const Spacer(),
                        StarRating(
                          rating: restaurantSnapshot.rating,
                          color: Colors.orange,
                          borderColor: Colors.grey,
                          starCount: 5,
                          size: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(restaurantSnapshot.description)
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
