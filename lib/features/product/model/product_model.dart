class ProductModel {
  late String name, details, price;

  ProductModel(
      {required this.name, required this.details, required this.price});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map();

    map['name'] = this.name;
    map['details'] = this.details;
    map['prices'] = this.price;

    return map;
  }

  ProductModel.fromMap(Map<dynamic, dynamic> map)
      : this.name = map['name'],
        this.details = map['details'],
        this.price = map['prices'];
}
