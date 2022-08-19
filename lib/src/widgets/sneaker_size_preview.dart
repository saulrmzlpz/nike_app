import 'package:flutter/material.dart';
import 'package:nike_app/src/models/sneaker_model.dart';
import 'package:nike_app/src/screens/sneaker_detail_screen.dart';
import 'package:provider/provider.dart';

class SneakerSizePreview extends StatelessWidget {
  const SneakerSizePreview({Key? key, this.sizes = const []}) : super(key: key);
  final List<double> sizes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (sizes.isNotEmpty) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const SneakerDetailScreen()));
        }
      },
      child: Material(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: sizes.isEmpty ? 5 : 25,
            vertical: sizes.isEmpty ? 5 : 0,
          ),
          width: double.maxFinite,
          height: sizes.isEmpty ? 410 : 430,
          decoration: BoxDecoration(
            borderRadius: sizes.isNotEmpty
                ? BorderRadius.circular(50)
                : const BorderRadiusDirectional.vertical(bottom: Radius.circular(50), top: Radius.circular(40)),
            color: const Color(0xFFFFCF53),
          ),
          child: Column(
            children: [
              const _SneakerImagePreview(),
              if (sizes.isNotEmpty) _SneakerSizes(sizes: sizes),
            ],
          ),
        ),
      ),
    );
  }
}

class _SneakerSizes extends StatelessWidget {
  const _SneakerSizes({
    Key? key,
    required this.sizes,
  }) : super(key: key);
  final List<double> sizes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(sizes.length, (index) => _SneakerSizeBox(size: sizes[index])),
      ),
    );
  }
}

class _SneakerSizeBox extends StatelessWidget {
  const _SneakerSizeBox({
    Key? key,
    required this.size,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final sneakerModel = Provider.of<SneakerModel>(context);

    return GestureDetector(
      onTap: () {
        sneakerModel.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: size == sneakerModel.size ? const Color(0xFFF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (size == sneakerModel.size)
              const BoxShadow(
                color: Color.fromARGB(255, 184, 124, 45),
                blurRadius: 10,
              )
          ],
        ),
        child: Text(
          size.toString().replaceAll(".0", ""),
          style: TextStyle(
            color: size == sneakerModel.size ? Colors.white : const Color(0xFFF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _SneakerImagePreview extends StatelessWidget {
  const _SneakerImagePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sneakerModel = Provider.of<SneakerModel>(context);

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Stack(children: [
        const Positioned(bottom: 0, right: 0, child: _SneakerShadow()),
        Image.asset(sneakerModel.assetImage),
      ]),
    );
  }
}

class _SneakerShadow extends StatelessWidget {
  const _SneakerShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), boxShadow: const [BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40)]),
      ),
    );
  }
}
