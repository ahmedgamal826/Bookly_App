import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  CustomBookImage({super.key, required this.width, required this.imageUrl});

  double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          width: width,
          // placeholder: (context, url) => const Center(
          //   child: CircularProgressIndicator(),
          // ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: 30,
          ),
        ),
      ),
    );
  }
}
