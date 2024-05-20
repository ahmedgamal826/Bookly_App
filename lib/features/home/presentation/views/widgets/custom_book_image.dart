import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  CustomBookImage({super.key, required this.width});

  var width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        // height: MediaQuery.of(context).size.height *
        //     0.5, // height of image = 0.32 from height of screen
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: const DecorationImage(
              image: AssetImage(Assets.test_image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
