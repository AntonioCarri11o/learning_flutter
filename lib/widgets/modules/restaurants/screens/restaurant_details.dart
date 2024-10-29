import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:learning_flutter/widgets/modules/restaurants/entities/restaurant.dart";
class RestaurantDetails extends StatefulWidget {
const RestaurantDetails({super.key, required this.id_restaurant,});

  final String id_restaurant;
  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  bool _isLoading = true;
  //final Restaurant restaurant;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}