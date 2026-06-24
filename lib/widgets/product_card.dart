import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback onTap; 

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          title: Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rp ${product.price}"),
              Text(product.desc), // ✅ gunakan desc, bukan description
              const SizedBox(height: 10),
              product.image.isNotEmpty
                  ? Image.memory(
                      base64Decode(product.image),
                      width: 120,
                      height: 120,

                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 120),
            ],
          ),
          // tombol edit
          leading: onEdit != null
              ? IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  onPressed: onEdit,
                )
              : null,
          // tombol delete
          trailing: onDelete != null
              ? IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                )
              : null,
        ),
      ),
    );
  }
}
