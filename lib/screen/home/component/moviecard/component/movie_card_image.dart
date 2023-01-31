import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCardImage extends StatelessWidget {
   MovieCardImage({
    super.key,
    required this.imageUrl,
  });

  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
            color: Colors.grey.shade900,
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.grey.shade700,
                  backgroundColor: Theme.of(context).primaryColor,
                  strokeWidth: 1,
                  value: downloadProgress.progress,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
