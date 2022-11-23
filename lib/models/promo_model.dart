import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [id, title, description, imageUrl];

  static List<Promo> promos = [
    Promo(
      id: 1,
      title: 'FREE Delivery on Your 3 Orders.',
      description: 'Place an order of \$10 or more and the delivery fee is on us',
      imageUrl: 'https://asset.kompas.com/crops/2A15_RHdnUPUsF60tuUwHxABswQ=/0x0:1000x667/750x500/data/photo/2021/10/21/617111bf79ded.jpg',
    ),
    Promo(
      id: 1,
      title: 'FREE Delivery on Your 3 Orders.',
      description: 'Place an order of \$10 or more and the delivery fee is on us',
      imageUrl: 'https://asset.kompas.com/crops/2A15_RHdnUPUsF60tuUwHxABswQ=/0x0:1000x667/750x500/data/photo/2021/10/21/617111bf79ded.jpg',
    ),
    Promo(
      id: 1,
      title: 'FREE Delivery on Your 3 Orders.',
      description: 'Place an order of \$10 or more and the delivery fee is on us',
      imageUrl: 'https://asset.kompas.com/crops/2A15_RHdnUPUsF60tuUwHxABswQ=/0x0:1000x667/750x500/data/photo/2021/10/21/617111bf79ded.jpg',
    ),
  ];
}
