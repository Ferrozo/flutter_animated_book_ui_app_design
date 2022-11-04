import 'package:animated_book_ui_app_design/src/domain/repository/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/models/card/card_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.cardInfo}) : super(key: key);
  final CardModel cardInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Icon(
                          Ionicons.close_outline,
                          color: Colors.black87,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.reorder_two_outline,
                        size: 50,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 100),
                  Positioned(
                    child: Image.asset(
                      cardInfo.cardUrlImage,
                      width: 230,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < draggableItems.length; i++)
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            color: i == 0
                                ? Colors.white
                                : const Color.fromARGB(112, 255, 255, 255),
                            height: 6,
                            width: 20,
                          )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    height: 230,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ISSUE Nº',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            '0X',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 100,
                            ),
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            '${cardInfo.cardTitle}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 178,
                right: 10,
                child: SizedBox(
                  height: 110,
                  width: 55,
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black87,
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(255, 3, 199, 173),
                        child: const Icon(
                          Icons.bookmark_border_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
