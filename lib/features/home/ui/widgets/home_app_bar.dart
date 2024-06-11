import 'package:flutter/material.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key})
      : super(
          title: const Text('Flugram'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        );
}
