import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nike_app/src/helpers/helpers.dart';
import 'package:nike_app/src/models/sneaker_model.dart';
import 'package:nike_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SneakerDetailScreen extends StatelessWidget {
  const SneakerDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helpers.changeLightStatusBar();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'Nike Air Max 720',
                child: SneakerSizePreview(),
              ),
              Positioned(
                  top: 60,
                  child: FloatingActionButton(
                      elevation: 0,
                      highlightElevation: 0,
                      splashColor: Colors.orange.withOpacity(0.5),
                      hoverColor: Colors.grey.withOpacity(0.3),
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                        Helpers.changeDarkStatusBar();
                      },
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 60,
                      )))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: const [
                SneakerDescription(
                  title: 'Nike Air Max 720',
                  description:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                ),
                _BuyNowSection(),
                _ColorPicker(),
                _InteractionUserItems()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _InteractionUserItems extends StatelessWidget {
  const _InteractionUserItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _InteractionButton(icon: Icon(Icons.star, color: Colors.red, size: 25)),
          _InteractionButton(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25)),
          _InteractionButton(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _InteractionButton extends StatelessWidget {
  const _InteractionButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: icon,
    );
  }
}

class _BuyNowSection extends StatelessWidget {
  const _BuyNowSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(children: [
        const Text(
          '\$180.0',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Bounce(delay: const Duration(seconds: 1), from: 8, child: const CustomButton(text: 'Buy now', height: 40, width: 120)),
      ]),
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(left: 90, child: _ColorItemButton(color: Color(0xFFC6D642), order: 4, asset: 'assets/imgs/verde.png')),
              Positioned(left: 60, child: _ColorItemButton(color: Color(0xFFFAAD29), order: 3, asset: 'assets/imgs/amarillo.png')),
              Positioned(left: 30, child: _ColorItemButton(color: Color(0xFF2099F1), order: 2, asset: 'assets/imgs/azul.png')),
              _ColorItemButton(color: Color(0xFF364D56), order: 1, asset: 'assets/imgs/negro.png'),
            ],
          )),
          const CustomButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xFFFFC675),
          ),
        ],
      ),
    );
  }
}

class _ColorItemButton extends StatelessWidget {
  const _ColorItemButton({
    Key? key,
    required this.color,
    required this.order,
    required this.asset,
  }) : super(key: key);

  final Color color;
  final int order;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: order * 100),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => Provider.of<SneakerModel>(context, listen: false).assetImage = asset,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
