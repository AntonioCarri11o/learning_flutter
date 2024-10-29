class Restaurant {
  final String _idDoc;
  final String _name;
  final String _description;
  final List<String> _images;
  final double _rating;
  final int _count;

  Restaurant(this._idDoc, this._name, this._description, this._images, this._rating, this._count);
  String get id => _idDoc;
  String get name => _name;
  String get description => _description;
  List<String> get images => _images;
  double get rating => _rating;
  int get count => _count;
}