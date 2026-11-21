import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/app_button.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text('product_details'.tr())),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          height: 310,
          decoration: BoxDecoration(
            color: product.color.withValues(alpha: .2),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Icon(product.icon, size: 150, color: product.color),
        ),
        const SizedBox(height: 24),
        Text(
          product.nameKey.tr(),
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          '\$${product.price.toStringAsFixed(0)}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          product.descriptionKey.tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
        const SizedBox(height: 28),
        AppButton(
          label: 'add_to_bag'.tr(),
          onPressed: () =>
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('added_to_bag'.tr()))),
        ),
      ],
    ),
  );
}
