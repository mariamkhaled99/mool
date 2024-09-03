enum Size { xs, s, m, l, xl }

enum CategoryBrand { zara, mango, americanEagle, only }

enum ProductsColors { white, black, red, blue }
class Product {
   final int index;
  final String title;
  final String imagePath;
  final double price;
  final Size size;
  final String category;
  final bool isNewArrival;
  final bool isBestSeller;
  final CategoryType categoryType;
  
  final CategoryBrand categoryBrand;

  Product({
    required this.index,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.size,
    required this.category,
    required this.isNewArrival,
    required this.isBestSeller,
    required this.categoryType, required this.categoryBrand,
  });
}

enum CategoryType { sale, tops, bottoms, tShirts, dresses, viewAll }

// Example of creating a list of products
final List<Product> products = [
  
    Product(
      index: 0,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Tops.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms',
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.tops,
    categoryBrand :CategoryBrand.zara,
  ),  Product(
    index: 1,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms',
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.bottoms,
    categoryBrand :CategoryBrand.zara,
  ),  Product(index: 2,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms',
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.dresses,
    categoryBrand :CategoryBrand.zara,
  ),  Product(
    index: 3,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms',
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.dresses,
    categoryBrand :CategoryBrand.zara,
  ),
];
CategoryType getCategoryType(String categoryTitle) {
  switch (categoryTitle.toLowerCase()) {
    case 'sale':
      return CategoryType.sale;
    case 'tops':
      return CategoryType.tops;
    case 'bottoms':
      return CategoryType.bottoms;
    case 't-shirts':
      return CategoryType.tShirts;
    case 'dresses':
      return CategoryType.dresses;
    case 'view all':
      return CategoryType.viewAll;
    default:
      throw ArgumentError('Unknown category: $categoryTitle');
  }
}
