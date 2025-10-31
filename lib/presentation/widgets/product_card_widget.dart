import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_text_style.dart';

class ProductCardWidget extends StatelessWidget {
  final String productName;
  final String image;
  final double price;

  ProductCardWidget({
    required this.productName,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 205, 233, 255),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(4),
            height: 100,
            width: 100,
            // decoration: BoxDecoration(color: Colors.grey),
            child: Image.network(
              image,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              },
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.contentStyle,
                ),
                SizedBox(height: 4),
                Text('\$ $price', style: AppTextStyle.subContentStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
