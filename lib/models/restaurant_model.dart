import 'package:equatable/equatable.dart';
import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final String priceCategory;
  final List<String> tags;
  final List<MenuItems> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.priceCategory,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        priceCategory,
        tags,
        menuItems,
        deliveryTime,
        deliveryFee,
        distance,
      ];

  static List<Restaurant> restaurant = [
    Restaurant(
        id: 1,
        name: 'Cavun',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fcavun.jpg?alt=media&token=8f8a4ba5-de7c-4773-8d4f-d144990b169a',
        priceCategory: ('\$\$'),
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 1))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 1))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 3.50,
        distance: 0.8),
    Restaurant(
        id: 2,
        name: 'Chicago Style',
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fchicago%20style.jpg?alt=media&token=af941b21-fc0d-4907-b03b-ba7d251dd309',
        priceCategory: ('\$\$'),
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 2))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 2))
            .toList(),
        deliveryTime: 25,
        deliveryFee: 2.50,
        distance: 0.5),
    Restaurant(
        id: 3,
        name: 'Craft Market',
        priceCategory: ('\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fcraft%20market.jpg?alt=media&token=b711c689-bbcb-4033-a735-7ddc4a7ac2b1',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 3))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 3))
            .toList(),
        deliveryTime: 27,
        deliveryFee: 3.25,
        distance: 1.2),
    Restaurant(
        id: 4,
        name: 'Dolce Vita',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fdolce%20vita.jpg?alt=media&token=593fb546-3417-4f46-9952-6b23e82750bd',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 4))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 4))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 2.99,
        distance: 0.9),
    Restaurant(
        id: 5,
        name: 'Doshka',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fdoshka.jpeg?alt=media&token=0d061a14-cde9-432f-bd07-e4367a39cab5',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 5))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 5))
            .toList(),
        deliveryTime: 20,
        deliveryFee: 2.75,
        distance: 0.3),
    Restaurant(
        id: 6,
        name: 'Fellini Piano Bar',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Ffellini%20piano%20bar.jpg?alt=media&token=6cba5ece-fc9a-4c53-9953-ae80f3fab6af',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 6))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 6))
            .toList(),
        deliveryTime: 35,
        deliveryFee: 3.55,
        distance: 1.4),
    Restaurant(
        id: 7,
        name: 'I Love Kebab',
        priceCategory: ('\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fi%20love%20kebab.jpg?alt=media&token=85464811-6365-42e4-8064-5668d99a7f10',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 7))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 7))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 2.80,
        distance: 0.5),
    Restaurant(
        id: 8,
        name: 'Kabinet',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fkabinet.jpeg?alt=media&token=b2b0baf9-698c-4037-9eb7-cdf000b0f991',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 8))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 8))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 3.20,
        distance: 0.8),
    Restaurant(
        id: 9,
        name: 'Mlyn',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fmlyn.jpg?alt=media&token=2b2d21db-b7aa-4b18-9a15-f56322aea0cd',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 9))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 9))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 3.10,
        distance: 0.1),
    Restaurant(
        id: 10,
        name: 'Zalissya',
        priceCategory: ('\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fzalissia.jpg?alt=media&token=ad4e9f36-8f22-4ab8-b62a-8b40e369c5d5',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 10))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 10))
            .toList(),
        deliveryTime: 26,
        deliveryFee: 2.77,
        distance: 0.6),
    Restaurant(
        id: 11,
        name: 'Zefir',
        priceCategory: ('\$\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fzefir.jpg?alt=media&token=075ee458-f0e3-492e-b93b-72f953e0ee5a',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 11))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 11))
            .toList(),
        deliveryTime: 21,
        deliveryFee: 3.05,
        distance: 0.3),
    Restaurant(
        id: 12,
        name: 'Zolota Gora',
        priceCategory: ('\$\$\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2Fzolota%20gora.jpg?alt=media&token=c38b9abe-e25b-4b34-8759-328dac7a55ea',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 12))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 12))
            .toList(),
        deliveryTime: 30,
        deliveryFee: 2.99,
        distance: 0.1),
    Restaurant(
        id: 13,
        name: '82100',
        priceCategory: ('\$'),
        imageUrl:
            'https://firebasestorage.googleapis.com/v0/b/delivery-app-368213.appspot.com/o/restaurants%2F82100.jpg?alt=media&token=11bb168a-5d9f-46eb-ada1-6830d3cd029d',
        tags: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 13))
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItems.menuItems
            .where((menuItems) =>
                menuItems.restaurantId.any((menuItems) => menuItems == 13))
            .toList(),
        deliveryTime: 26,
        deliveryFee: 2.99,
        distance: 0.5),
  ];
}
