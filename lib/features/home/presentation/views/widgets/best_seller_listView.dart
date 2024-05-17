import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 110,
          width: 80,
          child: AspectRatio(
            aspectRatio: 2.5 / 4, // width : height
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage(Assets.test_image), fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
