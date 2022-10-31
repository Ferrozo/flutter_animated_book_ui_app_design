import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
      body: const Center(
        child: Text('Details page'),
      ),
    );
  }
}
