import 'package:flutter/material.dart';
import 'package:nike_app/src/widgets/widgets.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.amount}) : super(key: key);

  final double amount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          Text('\$$amount',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              )),
          const Spacer(),
          const CustomButton(text: 'Add to cart'),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
