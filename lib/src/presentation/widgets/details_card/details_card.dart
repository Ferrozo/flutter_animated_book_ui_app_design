import 'package:flutter/material.dart';
import '../../../domain/modals/card/card_model.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final CardModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 220,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              child: Image.asset(
                profile.cardUrlImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
