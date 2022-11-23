import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuItems extends Equatable {
  final int id;
  final List<int> restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItems(
      {required this.id,
      required this.name,
      required this.restaurantId,
      required this.description,
      required this.category,
      required this.price});
  @override
  List<Object?> get props =>
      [id, name, restaurantId, description, price, category];

  static List<MenuItems> menuItems = [
    MenuItems(
      id: 1,
      restaurantId: [2, 3, 6, 8],
      name: 'Pizza',
      category: 'Pizza',
      description: 'Pizza with Tomatoes',
      price: 5.99,
    ),
    MenuItems(
      id: 2,
      restaurantId: [6, 8, 9, 10, 11, 12],
      name: 'Caesar',
      category: 'Salad',
      description: 'A cold beverage',
      price: 4.50,
    ),
    MenuItems(
      id: 3,
      restaurantId: [1, 4, 5, 6, 8, 11, 12],
      name: 'Strudel',
      category: 'Dessert',
      description: 'A cold beverage',
      price: 4.50,
    ),
    MenuItems(
      id: 4,
      restaurantId: [2, 3, 6, 13],
      name: 'Black Burger',
      category: 'Burger',
      description: 'A cold beverage',
      price: 4.50,
    ),
    MenuItems(
      id: 5,
      restaurantId: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13],
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A cold beverage',
      price: 1.99,
    ),
  ];
}
