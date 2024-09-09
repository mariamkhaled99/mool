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
  //  bool isFavourite;
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
    required this.categoryType,
    required this.categoryBrand,
  //  this.isFavourite = false,
  });

  get rating => null;

  get releaseDate => null;

  get dateAdded => null;

  get name => null;
}

enum CategoryType { Dresses, Tops, Bottoms, tShirts, ViewAll, Sale }

final List<Product> products = [
  Product(
    index: 0,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Tops.png',
    price: 49.99,
    size: Size.l,
    category: 'Tops', // Category is 'Tops'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Tops,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 1,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms', // Category is 'Bottoms'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Bottoms,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 2,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 3,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),Product(
    index: 4,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Tops.png',
    price: 49.99,
    size: Size.l,
    category: 'Tops', // Category is 'Tops'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Tops,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 5,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms', // Category is 'Bottoms'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Bottoms,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 6,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 7,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: true,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),
];



final List<Product> arrival_products = [
  Product(
    index: 0,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Tops.png',
    price: 49.99,
    size: Size.l,
    category: 'Tops', // Category is 'Tops'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Tops,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 1,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Bottoms', // Category is 'Bottoms'
    isNewArrival: true,
    isBestSeller: true,
    categoryType: CategoryType.Bottoms,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 2,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: false,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),
  Product(
    index: 3,
    title: 'Stylish Jeans',
    imagePath: 'assets/images/category/Bottoms.png',
    price: 49.99,
    size: Size.l,
    category: 'Dresses', // Category is 'Dresses'
    isNewArrival: true,
    isBestSeller: true,
    categoryType: CategoryType.Dresses,
    categoryBrand: CategoryBrand.zara,
  ),
];

// Object getCategoryType(String categoryTitle) {
//   switch (categoryTitle.toLowerCase()) {
//     case 'Sale':
//       return CategoryType.Sale;
//     case 'Tops':
//       return CategoryType.Tops;
//     case 'Bottoms':
//       return CategoryType.Bottoms;
//     case 'T-shirts':
//       return 'tShirts';
//     case 'dresses':
//       return CategoryType.Dresses;
//     case 'view all':
//       return CategoryType.ViewAll;
//     default:
//       throw ArgumentError('Unknown category: $categoryTitle');
//   }
// }
