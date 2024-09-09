class Category {
  final String title;
  final String imagePath;
  final int index;

  Category({
    required this.title,
    required this.imagePath,
    required this.index,
  });
}

final List<Category> categories = [
  Category(
      title: 'Sale', imagePath: 'assets/images/category/sale.png', index: 0),
  Category(
      title: 'Tops', imagePath: 'assets/images/category/Tops.png', index: 1),
  Category(
      title: 'Bottoms',
      imagePath: 'assets/images/category/Bottoms.png',
      index: 2),
  Category(
      title: 'T-Shirts',
      imagePath: 'assets/images/category/T-Shirts.png',
      index: 3),
  Category(
      title: 'Dresses',
      imagePath: 'assets/images/category/Dresses.png',
      index: 4),
  Category(
      title: 'View All', imagePath: 'assets/images/category/all.png', index: 5),
      // Category(
      // title: 'Bottoms',
      // imagePath: 'assets/images/category/Bottoms.png',
      // index: 6),
  // Category(
  //     title: 'T-Shirts',
  //     imagePath: 'assets/images/category/T-Shirts.png',
  //     index: 7),
  // Category(
  //     title: 'Dresses',
  //     imagePath: 'assets/images/category/Dresses.png',
  //     index: 8),
];
