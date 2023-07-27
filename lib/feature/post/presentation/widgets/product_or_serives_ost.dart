import 'package:flutter/material.dart';

class ProductOrServicesPost extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productPrice;
  final String storeName;

  const ProductOrServicesPost({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Precio: $productPrice',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                storeName,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
