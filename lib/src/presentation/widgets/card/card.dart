import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: builFrontCard(),
    );
  }

  Widget builCard() {
    return SizedBox(
      height: 100,
      width: 100,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 0),
          ),
        ),
      ),
    );
  }

  Widget builFrontCard() {
    return GestureDetector(
      onPanStart: (details) {},
      child: builCard(),
    );
  }
}
