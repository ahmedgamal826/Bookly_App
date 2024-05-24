import 'package:flutter/material.dart';

class CustomImageNewestListView extends StatelessWidget {
  const CustomImageNewestListView({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.25,
      child: AspectRatio(
        aspectRatio: 2.5 / 4, // width : height
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }
}
