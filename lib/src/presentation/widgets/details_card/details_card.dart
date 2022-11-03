import 'package:flutter/material.dart';
import '../../../domain/models/card/card_model.dart';
import '../../screens/details_page/details_page.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final CardModel profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_createRoute(profile));
      },
      child: Container(
        height: 320,
        width: 230,
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
      ),
    );
  }

  Route _createRoute(CardModel cardInfo) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => DetailsPage(
        cardInfo: cardInfo,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
