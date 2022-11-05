import 'package:animated_book_ui_app_design/src/domain/repository/cards_repository.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../domain/models/card/card_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.cardInfo}) : super(key: key);
  final CardModel cardInfo;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Container(
      color: Colors.orange,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 400,
                floating: true,
                flexibleSpace: Stack(
                  children: const <Widget>[
                    //image background
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        child: Text('Number'),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container();
              }))
            ],
          ),
        ),
      ),
    );
  }
}
