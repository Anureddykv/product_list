// lib/screens/product_details_screen.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                width: double.infinity,
                height: 300,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(product.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8.0),
            Text('Price: \$${product.price.toString()}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
