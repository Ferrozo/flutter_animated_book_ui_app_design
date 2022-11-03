import 'dart:math';

import 'package:animated_book_ui_app_design/src/domain/repository/cards_repository.dart';
import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../export_widgets.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer>
    with SingleTickerProviderStateMixin {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  int randomnumber = 0, randomminmax = 0;
  double randomdouble = 0.00;

  int randomNumber() {
    int random = Random().nextInt(1000); //1000 is MAX value
    //generate random number below 1000
    return random;
  }

  int randomNumberMinMax(int min, int max) {
    int randomminmax = min + Random().nextInt(max - min);
    //generate random number within minimum and maximum value
    return randomminmax;
  }

  double randomDouble() {
    double randomdouble = Random().nextDouble();
    //generate random double within 0.00 - 1.00;
    return double.parse(randomdouble.toStringAsFixed(4));
    //toStringAsFixed will fix decimal length to 4, 0.3454534 = 0.3454
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();
        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(
                draggableItems.length,
                (index) {
                  if (index == draggableItems.length - 1) {
                    return PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            const Rect.fromLTWH(0, 0, 500, 500),
                            const Size(500, 500)),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(
                                swipe != Swipe.none
                                    ? swipe == Swipe.left
                                        ? -50
                                        : 50
                                    : 0,
                                0,
                                500,
                                500),
                            const Size(580, 300)),
                      ).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: RotationTransition(
                        turns: Tween<double>(
                          begin: 0,
                          end: swipe != Swipe.none
                              ? swipe == Swipe.left
                                  ? -0.1 * 0.5
                                  : 0.1 * 0.5
                              : 0.0,
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve:
                                const Interval(0, 0.4, curve: Curves.easeInOut),
                          ),
                        ),
                        child: DragWidget(
                          profile: draggableItems[index],
                          index: index,
                          swipeNotifier: swipeNotifier,
                          isLastCard: true,
                        ),
                      ),
                    );
                  } else {
                    return Transform.rotate(
                      angle: index == 1 ? index * -0.07 : index * 0.07,
                      child: DragWidget(
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 46.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(width: 20),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 70.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 70.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(
                () {
                  draggableItems.removeAt(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
