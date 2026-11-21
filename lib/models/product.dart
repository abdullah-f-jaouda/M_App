import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.nameKey,
    required this.descriptionKey,
    required this.price,
    required this.icon,
    required this.color,
  });
  final String nameKey;
  final String descriptionKey;
  final double price;
  final IconData icon;
  final Color color;
}

const products = <Product>[
  Product(
    nameKey: 'product_lamp',
    descriptionKey: 'product_lamp_desc',
    price: 39,
    icon: Icons.light_rounded,
    color: Color(0xFFF3C96B),
  ),
  Product(
    nameKey: 'product_chair',
    descriptionKey: 'product_chair_desc',
    price: 89,
    icon: Icons.chair_rounded,
    color: Color(0xFF91B7A0),
  ),
  Product(
    nameKey: 'product_vase',
    descriptionKey: 'product_vase_desc',
    price: 24,
    icon: Icons.local_florist_rounded,
    color: Color(0xFFE795A5),
  ),
  Product(
    nameKey: 'product_clock',
    descriptionKey: 'product_clock_desc',
    price: 32,
    icon: Icons.access_time_filled_rounded,
    color: Color(0xFF9D9CE0),
  ),
];
