class catogeryModel {
  final String name;
  final String img;

  catogeryModel({required this.img, required this.name});
}

class productModel {
  final String img;
  final String name;
  final String price;
  final String rate;
  final String rateCount;

  productModel({
    required this.img,
    required this.name,
    required this.price,
    required this.rate,
    required this.rateCount,
  });
}
