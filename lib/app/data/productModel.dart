class ProductModel {
  final String title;
  final String subtitle;
  final String price;
  final String ratig;
  final String discount;
  final String image;

  final bool isfavorite;
  final bool isoffers;

  ProductModel({
    this.title,
    this.subtitle,
    this.price,
    this.ratig,
    this.discount,
    this.image,
    this.isfavorite = false,
    this.isoffers = false,
  });
}

List<ProductModel> productLsit = [
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/1.png',
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
    isfavorite: true,
    
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/1.png',
    isoffers: true
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
  ),
  new ProductModel(
    title: 'عطر لا بانثير من كارتييه للنساء ',
    subtitle: 'CHANEL',
    price: '340',
    ratig: '4',
    discount: '30%',
    image: 'assets/perfumeWoman/2.png',
  )
];
