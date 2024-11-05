import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String _idDoc;
  String _name;
  String _description;
  List<String> _images;
  double _rating;
  int _count;

  Restaurant(this._idDoc, this._name, this._description, this._images,
      this._rating, this._count);
  String get id => _idDoc;
  String get name => _name;
  String get description => _description;
  List<String> get images => _images;
  double get rating => _rating;
  int get count => _count;

  set idDoc(String value) {
    _idDoc = value;
  }

  set name(String value) {
    _name = value;
  }

  set description(String value) {
    _description = value;
  }

  set images(List<String> values) {
    _images.clear();
    _images = values;
  }

  set rating(double value) {
    _rating = value;
  }

  set count(int value) {
    _count = value;
  }
}
