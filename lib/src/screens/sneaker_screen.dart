import 'package:flutter/material.dart';
import 'package:nike_app/src/helpers/helpers.dart';
import 'package:nike_app/src/widgets/widgets.dart';

class SneakerScreen extends StatelessWidget {
  const SneakerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helpers.changeDarkStatusBar();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'For Saúl'),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  Hero(
                    tag: 'Nike Air Max 720',
                    child: SneakerSizePreview(
                      sizes: [7, 7.5, 8, 8.5, 9, 9.5],
                    ),
                  ),
                  SneakerDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          const AddToCartButton(amount: 100.0),
        ],
      ),
    );
  }
}
