import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_flutter/widgets/modules/restaurants/entities/restaurant.dart';
import 'package:learning_flutter/widgets/modules/restaurants/screens/restaurant_details.dart';

class CustomRestaurantItem extends StatelessWidget {
  const CustomRestaurantItem({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return RestaurantDetails(id_restaurant: restaurant.name);
        }));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(restaurant.images[0], width: 60, height: 60,),
          const SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name, style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(restaurant.description),
            ],
          ),
          const Spacer(),
          StarRating(
            rating: restaurant.rating / restaurant.count,
            color: Colors.orange,
            borderColor: Colors.grey,
            starCount: 5,
            size: 18,
          )
        ],
      ),
    );
  }
}

