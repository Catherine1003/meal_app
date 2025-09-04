import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CustomNetworkImage(
      {super.key, required this.imageUrl, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/placeholder.png",
            alignment: Alignment.center,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/placeholder.png",
            alignment: Alignment.center,
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
