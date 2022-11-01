import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/models/card/card_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.cardInfo}) : super(key: key);
  final CardModel cardInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Ionicons.reorder_two_outline,
                size: 50,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(children: [
          Text(cardInfo.cardTitle.toString()),
          Image.asset(cardInfo.cardUrlImage),
        ]),
      ),
    );
  }
}
